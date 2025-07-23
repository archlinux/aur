# Maintainer: Lance C. Booth <computerwizz98@yahoo.com>
pkgname=cpat
pkgver=1.4.2
pkgrel=1
pkgdesc="A curses based solitaire/patience collection of 9 games"
arch=('x86_64' 'i686')
url="http://cpat.sourceforge.net/"
license=('GPL2')
depends=('ncurses')
source=("https://master.dl.sourceforge.net/project/$pkgname/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('be255b694db5b48e2553ed16a12cd15bcd5a50fcc222424a8c947f04f1053b67')

CFLAGS="$CFLAGS -Wno-error=format-security"

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
