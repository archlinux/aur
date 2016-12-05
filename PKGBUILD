# Maintainer: Ilya Terentyev <bacondropped@gmail.com>

pkgname=colm-dev
pkgver=0.13.0.4
pkgrel=1
pkgdesc='Programming language designed for analysis and transformation of computer languages (development version)'
arch=('i686' 'x86_64')
url='https://www.colm.net/open-source/colm/'
license=('GPL')
makedepends=('gcc')
depends=('gcc-libs')
provides=('colm')
conflicts=('colm')
source=("https://www.colm.net/files/colm/colm-$pkgver.tar.gz")
sha1sums=('73664e259a5199beed87db57e9d87b7255a9c9b5')

build() {
	cd "$srcdir/colm-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/colm-$pkgver"

	make DESTDIR="$pkgdir/" install
	install -m0644 -D colm.vim "$pkgdir/usr/share/vim/vimfiles/syntax/colm.vim"
}
