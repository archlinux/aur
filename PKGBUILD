# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=1.4.2
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("clusterctl-linux-amd64-v$pkgver::https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('4ca2bcbc791ee3dda0dfba9d51f5b935f8a0aa26bc19606a73128eb7bd9bd630')

package() {
    install -Dm0755 "$srcdir/clusterctl-linux-amd64-v$pkgver" "$pkgdir/usr/bin/clusterctl"
    install -dm0755 "$pkgdir/usr/share/zsh/site-functions/"
    install -dm0755 "$pkgdir/usr/share/bash-completion/completions/"
    "$pkgdir/usr/bin/clusterctl" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_clusterctl"
    "$pkgdir/usr/bin/clusterctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/clusterctl"
}
