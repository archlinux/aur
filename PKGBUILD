# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=5.0.0
pkgrel=2
pkgdesc="Lightweight curses/X11 spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses' 'libxt')
source=(https://github.com/blippy/neoleo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('06907d392dd8f69ca12b760e340551a5')


build() {
	cd "$pkgname-$pkgver"
	./configure "CXXFLAGS= -fpermissive" --prefix=/usr 
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
