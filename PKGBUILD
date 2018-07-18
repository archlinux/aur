# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ark-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/heptio/ark"
optdepends=('kubectl-bin: To connect to Kubernetes')
license=('Apache')
source=("https://github.com/heptio/ark/releases/download/v${pkgver}/ark-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('1a452cd2b6f2b165da274b7b293c6a1f96c9020cd82a07f911a123634b82308f')

package() {
  cd "$srcdir"
  install -Dm 755 ark "$pkgdir/usr/bin/ark"
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/ark" completion bash > "$pkgdir/usr/share/bash-completion/completions/ark"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/ark" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_ark"
}
