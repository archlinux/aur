pkgname=wsmancli
pkgver=2.6.2
pkgrel=1
pkgdesc="Command line client utilities for WS-Management"
arch=('i686' 'x86_64')
url="https://github.com/Openwsman/$pkgname"
license=('custom:BSD')
depends=('openwsman>=2.5')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0d71728a66e810d5d20fbabc954460946c80ea84e2a394f5db0ee91225d90c59')

build() {
	cd "$pkgname-$pkgver"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	install -Dp -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh ts=4 sw=4 noet:
