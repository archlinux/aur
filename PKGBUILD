# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Streaming bar graph in the terminal from data passed through stdin'
pkgname=stag
pkgver=1.0.0
pkgrel=1
url=https://github.com/seenaburns/stag
license=(custom:BSD)
arch=(x86_64)
depends=(ncurses)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a668f8fbee3ffe28466f1fead3f85cb0415547f0a84c40c6c0fee6ca438b9f73805bcc7ae2d0029ed0b463524ac7042568bf54ecc803744ed3ff88471a37320e')

build () {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr
}

package () {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
