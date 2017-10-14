# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xorg-xmh
_pkgname=xmh
pkgver=1.0.3
pkgrel=1
pkgdesc="An xaw based mail program."
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libxaw')
makedepends=('xorg-util-macros' 'xbitmaps')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/releases/individual/app/${_pkgname}-${pkgver}.tar.bz2{,.sig})
validpgpkeys=('CFDF148828C642A7')
sha1sums=('09f7b3f683b0fe93da62e4dc8ed023fcacca078a'
          'SKIP')
source=(https://xorg.freedesktop.org/releases/individual/app/${_pkgname}-${pkgver}.tar.bz2)
sha1sums=('09f7b3f683b0fe93da62e4dc8ed023fcacca078a')

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

