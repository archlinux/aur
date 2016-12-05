# Maintainer: Ilya Terentyev <bacondropped@gmail.com>

pkgname=colm
pkgver=0.12.0
pkgrel=2
pkgdesc='Programming language designed for analysis and transformation of computer languages'
arch=('i686' 'x86_64')
url='https://www.colm.net/open-source/colm/'
license=('GPL')
makedepends=('gcc')
depends=('gcc-libs')
conflicts=('colm-dev')
source=("https://www.colm.net/files/colm/colm-$pkgver.tar.gz")
sha1sums=('6376377515c8c497e87b7bddf31e9f2d85bb8aa6')

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
