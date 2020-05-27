# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=10.0
pkgrel=3
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=(https://github.com/blippy/neoleo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('1a651d12bc2d1e43176a117b96178e0f')


build() {
	cd "$pkgname-$pkgver"
	unset CPPFLAGS
	unset CXXFLAGS
	./configure --prefix=/usr 
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
