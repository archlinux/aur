# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.20.2
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('any')
_vendor="github.com/terraform-linters/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-source.tar.gz::https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('5598d622ab19c2f6ebb4d18014dd2e9968ac7f0491ffc9e68b0baf9be1320801')
_vendorpath="gopath/src/$_vendor"

build() {
  cd $srcdir/tflint-${pkgver}
  go build -o tflint-bin
}

package() {
  install -Dm755 $srcdir/tflint-${pkgver}/tflint-bin $pkgdir/usr/bin/$pkgname
}
