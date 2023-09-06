# Maintainer: mickaelca <contact@mickael-caudrelier.fr>
pkgname=kubescape-bin
pkgver=2.9.1
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
05238afc67b1954b88a90eb5b90eadb7c898e07a2c965d26b47453867cd495a2
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/${provides}"
}
