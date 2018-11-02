# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ark-bin
pkgver=0.9.10
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/heptio/ark"
optdepends=(
  'kubectl: To connect to Kubernetes'
  'kubectl-bin: To connect to Kubernetes'
)
license=('Apache')
source=("https://github.com/heptio/ark/releases/download/v${pkgver}/ark-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c2b0ad0a2d22b3a647fdc44c2d4dcefaac29671ec6191405de6f0580f7134a4d')

package() {
  install -Dm 755 "$srcdir/ark" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/ark" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ark"
  "$pkgdir/usr/bin/ark" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_ark"
}
