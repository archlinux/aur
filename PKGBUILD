# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=unit-convert
pkgver=2.1.0
pkgrel=1
pkgdesc="Qt Unit Conversion Tool"
url="https://github.com/simonaw/unit-convert/"
arch=('x86_64' 'i686')
license=('LGPL2')
depends=('qt5-base' 'qt5-script')
source=("https://github.com/simonaw/unit-convert/archive/${pkgver}.tar.gz")
sha512sums=('ccca90db19aed1a51943689614446fe1db2849faa8ea262c44d36fcc60f1d650f2f08b5257fad1a441107d6c456dd5b0452843112c30f5c97a4ae447dfaebb82')
 
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
