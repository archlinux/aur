# Maintainer: Mark Carter <alt.mcarter@gmail.com>
pkgname=neoleo
pkgver=4.0.1
pkgrel=1
pkgdesc="Lightweight curses/Motif spreadsheet based on GNU oleo"
arch=('i686' 'x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses' 'tcl' 'xbae')
makedepends=('swig')
source=("https://github.com/blippy/neoleo/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('f1b9e6f1b148325fb1858abfb7039cd6')


build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr 
	make
}


package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
