# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=xorg-xkbprint
pkgver=1.0.5
pkgrel=1
pkgdesc="generates a PostScript description of an XKB keyboard description"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libxkbfile')
makedepends=('xorg-util-macros')
groups=('xorg-apps' 'xorg')
source=(${url}/releases/individual/app/xkbprint-${pkgver}.tar.bz2)
sha1sums=('e707caffb3c680b3a869a776aa3f80caeac9e9c3')

build() {
  cd "${srcdir}/xkbprint-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/xkbprint-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

