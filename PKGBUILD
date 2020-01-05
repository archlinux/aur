# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=9.0
pkgrel=2
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=(https://github.com/blippy/neoleo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('fd868889016741f267c3e30a61ae5d61')


build() {
	cd "$pkgname-$pkgver"
	unset CPPFLAGS
	./configure --prefix=/usr 
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
