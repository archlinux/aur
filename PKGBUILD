# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=vile
pkgver=9.8_za
_basever=${pkgver//_/}
pkgrel=2
pkgdesc="vi like emacs"
arch=('x86_64')
url="http://invisible-island.net/vile/vile.html"
depends=('ncurses' 'glibc' 'libxcrypt' 'bash')
license=('custom')
source=( https://invisible-island.net/archives/vile/current/vile-${_basever}.tgz )
sha256sums=( 65ba15ec145dfc5506217162228c7d88f01c0490a0dccde7a8a19f1c7c1b93b2 )

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

