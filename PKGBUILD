# Maintainer: ajs124 < aur AT ajs124 DOT de > 
# Contributor: SiD/sidious <miste78@web.de>

pkgname=xtris
pkgver=1.15
pkgrel=3
pkgdesc="Multiplayer Tetris for X"
arch=('i686' 'x86_64')
url="http://www.iagora.com/~espel/xtris/xtris.html"
license=('GPL')
depends=('libx11')
source=("http://ftp.uni-erlangen.de/mirrors/gentoo/distfiles/xtris-1.15.tar.gz" \
	"Makefile.diff")
md5sums=('c63be31895feca9f929b57b67b779ced' \
	 '4085d4fab44f52fd521818023d36251e')

build() {
  cd "$srcdir/$pkgname"
  patch -p0 < ../Makefile.diff
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
