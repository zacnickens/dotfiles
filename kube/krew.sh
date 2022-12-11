#!/usr/bin/env sh

echo "installing krew"

(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" &&
  tar zxvf krew.tar.gz &&
  KREW=./krew-"${OS}_${ARCH}" &&
  "$KREW" install krew
)

echo "checking krew"


kubectl krew

echo "install plugins"

kubectl krew install access-matrix advise-psp ca-cert cert-manager ctx config-cleanup df-pv \n
doctor evict-pod flame fleet fuzzy graph grep images ingress-nginx janitor konfig minio mtail \n
neat node-shell np-viewer ns operator outdated pod-dive pod-lens pod-inspect pod-logs pod-shell \n
podevents popeye rbac-lookup rbac-view reliably resource-capacity resource-snapshot resource-versions \n
restart rolesum roll score service-tree shovel sick-pods split-yaml starboard tail tap topology trace \n 
tree view-allocations view-cert view-serviceaccount-kubeconfig view-utilization who-can whoami


echo "update krew and plugins"

kubectl krew update

echo "upgrade plugins"

kubectl krew upgrade


echo "have fun in kubernetes land"

kubectl krew list
