# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: sp42b <sp42b|a_t|gmx.net>

pkgname=cavez-of-phear
pkgver=0.5.1
pkgrel=1
pkgdesc="A Boulder Dash like game for consoles/terminals. Level editor included."
arch=('i686' 'x86_64')
url="http://www.x86.no/cavezofphear/"
license=('GPL')
depends=('ncurses')
source=(http://www.x86.no/cavezofphear/phear-$pkgver.tar.bz2)
md5sums=('c9b3751dc52d332aaf04cbed4addf7c1')

build() {
  cd "$srcdir/phear-$pkgver"
  make
}

package() {
  cd "$srcdir/phear-$pkgver"
  make DESTDIR_BIN="$pkgdir/usr/bin" DESTDIR_DATA="$pkgdir/usr/share" install
}

