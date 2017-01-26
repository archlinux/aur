# Maintainer: Brian "Beej" Hall <beej@beej.us>
pkgname=trader
pkgver=7.9
pkgrel=1
pkgdesc="Star Trader, a simple text-based game of interstellar trading"
arch=('i686' 'x86_64')
url="http://www.zap.org.au/software/trader/"
license=('GPL')
depends=('ncurses')
source=("ftp://ftp.zap.org.au/pub/trader/unix/$pkgname-$pkgver.tar.xz")
md5sums=('454b824b26003704337d91dd203e2a5a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
