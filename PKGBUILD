# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=colorcode
_pkgname=ColorCode
pkgver=0.8.7
pkgrel=1
pkgdesc="Advanced MasterMind game and solver"
arch=('i686' 'x86_64')
url="http://${pkgname}.laebisch.com/"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
install=${pkgname}.install
source=("http://${pkgname}.laebisch.com/download/${_pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop" "${pkgname}.png")
md5sums=('9ada35712a8b32f5462b382e083c5aa8'
         'e2f3f71d01cc7aa842f64a5490a5aa6d'
         '648b63a6de3129b72c752ba893a856a1')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build_cmake
  cmake ../src
  make
}

package() {
  install -DTm755 ${srcdir}/${_pkgname}-${pkgver}/build_cmake/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -DTm644 ${srcdir}/${pkgname}.png     "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -DTm644 ${srcdir}/${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  }
