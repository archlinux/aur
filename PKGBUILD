# Maintainer: Sijmen J. Mulder <ik@sjmulder.nl>
pkgname=within
pkgver=1.1.1
pkgrel=1
pkgdesc='Run a command in other directories'
arch=(x86_64)
url=https://github.com/sjmulder/$pkgname
license=(AGPL3)
depends=(glibc)
source=($pkgname-$pkgver.tar.gz::https://github.com/sjmulder/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(07fc63ff4ddb184d5ae9b90faf1764bc107ffdf9cc938618a6ce083989192882)

build() {
	cd $pkgname-$pkgver
	make
}

check() {
	cd $pkgname-$pkgver
	make check
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man
}
