# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=xorg-xgc
pkgver=1.0.5
pkgrel=1
pkgdesc="Xaw-based graphics demo that shows/tests various features of the X11 core protocol graphics primitives."
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libxaw')
makedepends=('xorg-util-macros')
groups=('xorg-apps' 'xorg')
source=(http://xorg.freedesktop.org/archive/individual/app/xgc-${pkgver}.tar.bz2)
sha256sums=('14828d9bda358ad57efc0206bc416ee33ba542091edb186485cca5389adc2f5e')

build() {
  cd "${srcdir}/xgc-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/xgc-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
