pkgname=wsmancli
pkgver=2.6.0
pkgrel=1
pkgdesc="Command line client utilities for WS-Management"
arch=('i686' 'x86_64')
url="https://github.com/Openwsman/$pkgname"
license=('BSD')
depends=('openwsman>=2.5')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('df418d6d78160fd4f88f890a8953907a')

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
