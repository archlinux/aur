# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ark-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/heptio/ark"
optdepends=('kubectl-bin: To connect to Kubernetes')
license=('Apache')
source=("https://github.com/heptio/ark/releases/download/v${pkgver}/ark-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('7b01746f05438b615a475b19a5cc3c59f282a4387c5a98fa3b88b450a946d1a7')

package() {
  cd "$srcdir"
  install -Dm 755 ark "$pkgdir/usr/bin/ark"
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/ark" completion bash > "$pkgdir/usr/share/bash-completion/completions/ark"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/ark" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_ark"
}
