# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=11.0
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=(https://github.com/blippy/neoleo/archive/v$pkgver.tar.gz)
md5sums=('560c28fabd4b6440f4f03763d82463c6')


build() {
	cd "$pkgname-$pkgver"
	unset CPPFLAGS
	unset CXXFLAGS
	autoreconf -iv
	./configure --prefix=/usr 
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
