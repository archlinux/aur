# Maintainer: nubzzz <contact@nubzzz.com>
pkgname=kubescape-bin
pkgver=4.0.8
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
3603bab7dab0da948967769db803843af70c11295f05d63beff4ecd7c91a9b20
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/${provides}"
}
