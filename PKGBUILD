# Maintainer: James-Adam Renquinha Henri <jarhmander@gmail.com>
# (mostly a ripoff of pantum-p2000-driver, with a few enhancements)
pkgname=pantum-p2200-p2500-driver
pkgver="1.1.106"
pkgrel=1
pkgdesc="Pantum P2200 and P2500 series drivers"
arch=('x86_64')
url="http://global.pantum.com/global/"
license=('proprietary')
depends=('cups')
makedepends=('unzip')
_basename="Pantum%20Ubuntu%20Driver%20V${pkgver//\./_}"
_zipname="${_basename}.zip"
_baseurl="https://drivers.pantum.com/userfiles/files/download/drive"
source=(
  "${_baseurl}/${_zipname}"
)
md5sums=('0f4dd5486590cc1a0cd8b28bdfe8bc84')

build() {
  cd ${srcdir}
  ar x "Pantum Ubuntu Driver V${pkgver}/Resources/pantum_${pkgver}-${pkgrel}_amd64.deb" data.tar.xz
  mkdir -p ${pkgname}-${pkgver}
  bsdtar -xf data.tar.* -C ${pkgname}-${pkgver}
}

package() {
  cd ${pkgdir}
  cp -a ${srcdir}/${pkgname}-${pkgver}/* .
}

# vim:set ts=2 sw=2 et:
