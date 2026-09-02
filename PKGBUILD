# Maintainer: nubzzz <contact@nubzzz.com>
pkgname=kubescape-bin
pkgver=4.0.13
pkgrel=1
pkgdesc="kubescape is the first tool for testing if Kubernetes is deployed securely as defined in Kubernetes Hardening Guidance by to NSA and CISA"
provides=('kubescape')
arch=('x86_64')
url="https://github.com/kubescape/kubescape"
license=("APACHE")
source=(
$pkgname-$pkgver::https://github.com/kubescape/kubescape/releases/download/v${pkgver}/kubescape_${pkgver}_linux_amd64
)
sha256sums=(
b83573f8bd38112867b9f8d7e76de02b8f6ed5376ea39ad6caab9cd2d1aaa676
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/${provides}"
}
