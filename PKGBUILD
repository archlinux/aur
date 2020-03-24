# Binary variant maintainer: <   Ron  Varburg  AT  yahoo  com   >
# Contributor: Original submitter of pantum-p2000-driver:
#   Jack Kamm <jackkamm@gmail.com>

pkgname=pantum-p1000-p2000-p3000-m5100-m5200-ppd-driver
pkgver="1.00_1"
pkgrel=4
pkgdesc="PPDs, drivers, for Pantum P1000, P2000, P3000, M5100, M5200 printers"
arch=('x86_64')
url="http://global.pantum.com/global/"
license=('proprietary')
conflicts=('pantum-p2000-driver')
depends=('cups')
makedepends=('unzip')
source=(
  "http://global.pantum.com/global/wp-content/uploads/2016/01/Pantum-P2000-Series-Linux-DriverUbutun12.04V1.00-1.zip"
)
md5sums=('0024556a55eacef3d63ed4478ea1490d')

build() {
  cd $srcdir
  mkdir -p ${pkgname}-${pkgver}
  bsdtar -xf \
    " Pantum 2000 Series Linux Driver (Ubutun12.04) V1.00/Pantum-0.3-1.${arch}.rpm" \
    -C ${pkgname}-${pkgver}
}

package() {
  cd ${pkgdir}
  cp -a ${srcdir}/${pkgname}-${pkgver}/* .
}

# vim:set ts=2 sw=2 et:
