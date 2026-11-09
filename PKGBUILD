# Maintainer: nubzzz <contact@nubzzz.com>
pkgname=kubescape-bin
pkgver=4.0.20
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
25649b3e1212a86bbd467d3e73812218459455c335fad7aaed7fe458782355c5
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/${provides}"
}
