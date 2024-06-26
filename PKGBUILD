# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=xorg-xgc
pkgver=1.0.6
pkgrel=3
pkgdesc="Xaw-based graphics demo that shows/tests various features of the X11 core protocol graphics primitives."
arch=(i686 x86_64)
url="https://gitlab.freedesktop.org/xorg/app/xgc"
license=('MIT')
depends=('libxt' 'glibc' 'libxaw' 'libx11')
makedepends=('xorg-util-macros')
groups=('xorg-apps' 'xorg')
source=(http://xorg.freedesktop.org/archive/individual/app/xgc-${pkgver}.tar.gz)
sha256sums=('8b5cfc547c04a2bd0807be700349522c0e717e34387019dd209eefa83cfa74f0')

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
