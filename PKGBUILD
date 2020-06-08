# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.16.2
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('any')
_vendor="github.com/terraform-linters/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-source.tar.gz::https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('a062d206d78ac1b8010c4c88603d65c6a089a13d0bce01ff766261bbe350741b')
_vendorpath="gopath/src/$_vendor"

build() {
  cd $srcdir/tflint-${pkgver}
  go build -o tflint-bin
}

package() {
  install -Dm755 $srcdir/tflint-${pkgver}/tflint-bin $pkgdir/usr/bin/$pkgname
}
