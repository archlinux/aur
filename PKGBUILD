# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=7.0.0
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('i686' 'x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=(https://github.com/blippy/neoleo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('093e63f0bd460c5ab147ac4db673eb4b')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr 	
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
