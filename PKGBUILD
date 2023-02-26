# Maintainer: James-Adam Renquinha Henri <jarhmander@gmail.com>
# (mostly a ripoff of pantum-p2000-driver, with a few enhancements)
pkgname=pantum-p2200-p2500-driver
pkgver="1.1.94"
pkgrel=1
pkgdesc="Pantum P2200 and P2500 series drivers"
arch=('x86_64')
url="http://global.pantum.com/global/"
license=('proprietary')
depends=('cups')
makedepends=('unzip')
_basename="Pantum%20Linux%20Driver%20V${pkgver//\./_}-${pkgrel}"
_zipname="${_basename}.zip"
_baseurl="https://drivers.pantum.com/userfiles/files/download/%E9%A9%B1%E5%8A%A8%E6%96%87%E4%BB%B6/2013"
source=(
  "${_baseurl}/${_zipname}"
)
md5sums=('aaff9109af8b0070224bc722a93e72a8')

build() {
  cd ${srcdir}
  ar x "Pantum Linux Driver V${pkgver}-${pkgrel}/Resources/pantum_${pkgver}-${pkgrel}_amd64.deb" data.tar.xz
  mkdir -p ${pkgname}-${pkgver}
  bsdtar -xf data.tar.* -C ${pkgname}-${pkgver}
}

package() {
  cd ${pkgdir}
  cp -a ${srcdir}/${pkgname}-${pkgver}/* .
}

# vim:set ts=2 sw=2 et:
