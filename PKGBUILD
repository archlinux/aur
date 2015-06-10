# Maintainer: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=xorg-xgc
pkgver=1.0.4
pkgrel=2
pkgdesc="Xaw-based graphics demo that shows/tests various features of the X11 core protocol graphics primitives."
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libxaw')
makedepends=('xorg-util-macros')
groups=('xorg-apps' 'xorg')
source=(http://xorg.freedesktop.org/archive/individual/app/xgc-${pkgver}.tar.bz2)
sha256sums=('5ed8dc52619ed563ad51b8428a1e1678cdd40b30e8160396ee9e41b46f247e8d')

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