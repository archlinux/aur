# Maintainer: mickaelca <contact@mickael-caudrelier.fr>
pkgname=kubescape-bin
pkgver=1.0.119
pkgrel=1
pkgdesc="kubescape is the first tool for testing if Kubernetes is deployed securely as defined in Kubernetes Hardening Guidance by to NSA and CISA"
provides=('kubescape')
arch=('x86_64')
url="https://github.com/armosec/kubescape"
license=("APACHE")
source=(
$pkgname-$pkgver::https://github.com/armosec/kubescape/releases/download/v${pkgver}/kubescape-ubuntu-latest
)
sha256sums=(
53b04c254d353c0682183085c8914b4afb63b5ebab14e2ffa0d364e10e3b2599
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/${provides}"
}
