# Maintainer: Christian Stake <christian.stake@posteo.de>
pkgname=max-control
pkgver=0.4.2
pkgrel=1
pkgdesc="Controls home automation with max! eq3 system"
arch=('i686' 'x86_64')
url="https://www.tabos.org/max-control/"
license=('GPL')
groups=(tools)
depends=(gtk3 make autoconf)
source=("http://www.tabos.org/downloads/max-control-0.4.2.tar.xz")
md5sums=(9b9ed1c0f6d043fea47b44622bff3fb4)
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	autoconf
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
 
