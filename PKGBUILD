# Maintainer: mickaelca <contact@mickael-caudrelier.fr>
pkgname=kubescape-bin
pkgver=1.0.122
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
07dea5302bfb8f57d7162f57bf3ef65038613b390f07a44c74876abadead4f5c
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/${provides}"
}
