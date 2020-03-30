# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.15.3
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('any')
_vendor="github.com/terraform-linters/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-source.tar.gz::https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('878498373f45e6a34a3e1016339309ba973d7f13887430ec9674d745a751e170')
_vendorpath="gopath/src/$_vendor"

build() {
  cd $srcdir/tflint-${pkgver}
  go build -o tflint-bin
}

package() {
  install -Dm755 $srcdir/tflint-${pkgver}/tflint-bin $pkgdir/usr/bin/$pkgname
}
