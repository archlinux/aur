# Maintainer: Eric Waller <ewwaller@gmail.com>
pkgname=spacewar
pkgver=0.1
pkgrel=2
pkgdesc="PDP-1 SpaceWar! Game"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/pdp1spacewar/"
license=('GPL')
groups=(users)
depends=(wxgtk)
makedepends=('make' 'gcc')
source=(http://sourceforge.net/projects/pdp1spacewar/files/spacewar.tar.gz/download)
#	missing.tar.gz)
md5sums=('9f4bc5fdbb6bd9317cdecaffeb31ac1c')
#         '880def4453c809371871e5f2d043c42c')

build() {
  cd "$srcdir/$pkgname"
  touch ChangeLog
  aclocal
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
