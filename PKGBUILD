# Maintainer: Lance C. Booth <computerwizz98@yahoo.com>
pkgname=cpat
pkgver=1.4.1
pkgrel=2
pkgdesc="A curses based solitaire/patience collection of 9 games"
arch=('x86_64' 'i686')
url="http://cpat.sourceforge.net/"
license=('GPL3')
depends=('ncurses')
source=("https://master.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('48b9a67cf5b8c9ce0b65de2d75c2086e37067bfa9b401f3d660465f1fd863327')

CFLAGS="$CFLAGS -fcommon"

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
