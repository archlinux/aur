# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=8.0.0
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=(https://github.com/blippy/neoleo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('a2d72f1cd0ecfc5318735cb7a4600636')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr 
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
