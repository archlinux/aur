# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ark-bin
pkgver=0.10.0
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
sha256sums=('77415be3faf5184cb75c255d70c33efc6e7c4d23c5efdd634095136bd8601821')

package() {
  install -Dm 755 "$srcdir/ark" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/ark" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ark"
  "$pkgdir/usr/bin/ark" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_ark"
}
