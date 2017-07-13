# Maintainer: Ilya Terentyev <bacondropped@gmail.com>

pkgname=colm-dev
pkgver=0.13.0.5
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
sha1sums=('c915b9a05bdcdd4bde2bfd57425450dfc8fa95d7')

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
