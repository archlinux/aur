# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=unit-convert
pkgver=2.2.0
pkgrel=2
pkgdesc="Qt Unit Conversion Tool"
url="https://www.chronowerks.de/cgit/unit-convert/"
arch=('x86_64' 'i686')
license=('LGPL2')
depends=('qt5-base' 'qt5-script')
source=("https://www.chronowerks.de/cgit/unit-convert/snapshot/unit-convert-${pkgver}.tar.bz2")
sha512sums=('8713705f3801e44a2280020d0c2255958b84db869dc05cf3c5c5b3e49b1e0b460c50ba7ae72143db311726ace0d9cb2739d7a95c4a1b595e2d27b5038b82cb35')
 
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
