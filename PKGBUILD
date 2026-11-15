# Maintainer: nubzzz <contact@nubzzz.com>
pkgname=kubescape-bin
pkgver=4.0.21
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
7a997a0d46ea37f83fa33d318e615721f569f3721b36a96f7f2c0254b6570fae
)

build() {
  cd "$srcdir"
}

package () {
  cd "$pkgdir"

  mkdir -p "usr/bin"

  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/${provides}"
}
