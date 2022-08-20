# Maintainer: James-Adam Renquinha Henri <jarhmander@gmail.com>
# (mostly a ripoff of pantum-p2000-driver, with a few enhancements)
pkgname=pantum-p2200-p2500-driver
pkgver="1.1.84"
pkgrel=1
pkgdesc="Pantum P2200 and P2500 series drivers"
arch=('x86_64')
url="http://global.pantum.com/global/"
license=('proprietary')
depends=('cups')
makedepends=('unzip')
_basename="PantumUbuntuDriverV${pkgver}-1_1644314880975"
_zipname="${_basename}.zip"
source=(
  "https://drivers.pantum.com/userfiles/files/download/${_zipname}"
)
md5sums=('1343c21c2aa5db6cf0ee4499b6a7188f')

build() {
  cd ${srcdir}
  ar x "Pantum Ubuntu Driver V${pkgver}-${pkgrel}/Resources/pantum_${pkgver}-${pkgrel}_amd64.deb" data.tar.xz
  mkdir -p ${pkgname}-${pkgver}
  bsdtar -xf data.tar.* -C ${pkgname}-${pkgver}
}

package() {
  cd ${pkgdir}
  cp -a ${srcdir}/${pkgname}-${pkgver}/* .
}

# vim:set ts=2 sw=2 et:
