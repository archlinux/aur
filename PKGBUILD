# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ark-bin
pkgver=0.10.1
pkgrel=2
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/heptio/ark"
optdepends=(
  'kubectl: To connect to Kubernetes'
  'kubectl-bin: To connect to Kubernetes'
)
install="ark-bin.install"
license=('Apache')
source=("https://github.com/heptio/ark/releases/download/v${pkgver}/ark-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('29cdc7abc0dbdaafdd2c4999e8eeda71fcefff188d3ed5e6a06cb9625e70da3d')

package() {
  install -Dm 755 "$srcdir/ark" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/ark" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ark"
  "$pkgdir/usr/bin/ark" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_ark"
}
