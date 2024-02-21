# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=vile
pkgver=9.8_z
_basever=${pkgver//_/}
pkgrel=1
pkgdesc="vi like emacs"
arch=('x86_64')
url="http://invisible-island.net/vile/vile.html"
depends=('ncurses')
license=('custom')
source=( https://invisible-island.net/archives/vile/current/vile-${_basever}.tgz )
sha256sums=( 0b3286c327b70a939f21992d22e42b5c1f8a6e953bd9ab9afa624ea2719272f7 )

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

