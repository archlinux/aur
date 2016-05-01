# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=colorcode
_pkgname=ColorCode
pkgver=0.8.5
pkgrel=2
pkgdesc="Advanced MasterMind game and solver"
arch=('i686' 'x86_64')
url="http://${pkgname}.laebisch.com/"
license=('GPL')
depends=('qt5-base')
makedepends=('make')
install=${pkgname}.install
source=("http://${pkgname}.laebisch.com/download/${_pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop" "${pkgname}.png")
md5sums=('e4ee0dac0c99605af886f3ecd8a55106'
         'e2f3f71d01cc7aa842f64a5490a5aa6d'
         '648b63a6de3129b72c752ba893a856a1')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  qmake
  make
}

package() {
  install -DTm755 ${srcdir}/${_pkgname}-${pkgver}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -DTm644 ${srcdir}/${pkgname}.png     "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -DTm644 ${srcdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  }
