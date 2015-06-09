pkgname=wsmancli
pkgver=2.5.0
pkgrel=1
pkgdesc="Command line client utilities for WS-Management"
arch=('i686' 'x86_64')
url="https://github.com/Openwsman/$pkgname"
license=('BSD')
depends=('openwsman>=2.5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('bbf801acba9a84565e9cfa05f0bd6f08')

build() {
	cd "$pkgname-$pkgver"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
