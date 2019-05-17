# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-kind-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Kubernetes in Docker - local clusters for testing"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/kind"
depends=('docker')
optdepends=(
  'kubectl: check cluster status'
  'kubectl-bin: check cluster status - binary package'
)
license=('Apache')
source=("https://github.com/kubernetes-sigs/kind/releases/download/v${pkgver}/kind-linux-amd64")
md5sums=('4f9a7cc85b2cec6bf99ccd3a636a68d3')

package() {
  install -Dm755 "$srcdir/kind-linux-amd64" "$pkgdir/usr/bin/kind"

  "$pkgdir/usr/bin/kind" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/kind"
  "$pkgdir/usr/bin/kind" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_kind"
}
