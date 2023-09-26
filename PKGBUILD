# Maintainer: Gabriel M. Dutra <nulldutra@proton.me>

pkgname=tflint
pkgver=0.48.0
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('any')
_vendor="github.com/terraform-linters/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-source.tar.gz::https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('9643ea803796a01c9dcbd63b7f624a1d5499b258d79639c311738ab1ce67e1c2')
_vendorpath="gopath/src/$_vendor"

build() {
  cd $srcdir/tflint-${pkgver}
  go build -o tflint-bin
}

package() {
  install -Dm755 $srcdir/tflint-${pkgver}/tflint-bin $pkgdir/usr/bin/$pkgname
}
