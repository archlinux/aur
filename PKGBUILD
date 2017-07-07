# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=6.0.0
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('i686' 'x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=(https://github.com/blippy/neoleo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('c7602089853a4b38f90e7fe5874c9b2f')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr 
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
