# Maintainer: nubzzz <contact@nubzzz.com>
pkgname=kubescape-bin
pkgver=4.0.15
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
011569dbcde85afc96cf63262e4f967166b6680fd70a623e9065334b6767b244
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/${provides}"
}
