# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

pkgname=tflint
pkgver=0.12.1
pkgrel=3
pkgdesc="A linter for Terraform code"
arch=('any')
_vendor="github.com/terraform-linters/${pkgname}"
url="https://${_vendor}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver-${CARCH}.zip::https://${_vendor}/archive/v${pkgver}.tar.gz")
sha256sums=('fd790d2b6da1565355d0fd366b48b3bbf9c9a21f81052c40da400a0586f7e201')
_vendorpath="gopath/src/$_vendor"

package() {
  cd $srcdir/tflint-${pkgver}
  go build -o tflint-bin
  install -Dm755 tflint-bin $pkgdir/usr/bin/$pkgname
}
