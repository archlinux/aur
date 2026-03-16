# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=vile
pkgver=9.8_zb
_basever=${pkgver//_/}
pkgrel=1
pkgdesc="vi like emacs"
arch=('x86_64')
url="http://invisible-island.net/vile/vile.html"
depends=('ncurses' 'glibc' 'libxcrypt' 'bash' 'perl')
license=('custom')
options=(!debug)
source=( https://invisible-island.net/archives/vile/current/vile-${_basever}.tgz )
sha256sums=( d6239e6b728fa9d0b49f526d8f0998d2db4b7a7dfc317273dbff7aea2a09ea31 )

build() {
  cd "$srcdir"/$pkgname-${_basever}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-${_basever}

  make DESTDIR=${pkgdir} install
  install -D -m 644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

