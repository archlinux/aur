# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ark-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/heptio/ark"
optdepends=('kubectl-bin: To connect to Kubernetes')
license=('Apache')
source=("https://github.com/heptio/ark/releases/download/v${pkgver}/ark-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('174650898e3c09b7055cf1696e7e3470e97df46651e4ac590c2bbd6e99bae4c1')

package() {
  cd "$srcdir"
  install -Dm 755 ark "$pkgdir/usr/bin/ark"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/ark" completion bash > "$pkgdir/usr/share/bash-completion/completions/ark"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/ark" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_ark"
}
