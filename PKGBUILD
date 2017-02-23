# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=unit-convert
pkgver=2.0.7
pkgrel=1
pkgdesc="Qt Unit Conversion Tool"
url="https://github.com/simonaw/unit-convert/"
arch=('x86_64' 'i686')
license=('LGPL2')
depends=('qt5-base' 'qt5-script')
source=("https://github.com/simonaw/unit-convert/archive/${pkgver}.tar.gz")
md5sums=('50135c71d5a93b2c61022451c453fc78');
 
build() {
  cd "${pkgname}-${pkgver}"
  qmake
  make
}
 
package() {
  local t=opt/${pkgname}
  install -d -m755 ${pkgdir}/$t/
  install -m755 ${srcdir}/${pkgname}-${pkgver}/bin/convert ${pkgdir}/$t/
  install -m644 ${srcdir}/${pkgname}-${pkgver}/bin/data.rcc ${pkgdir}/$t/
}
