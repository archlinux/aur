# Maintainer: Ken Enda <buhibuhidog@gmail.com>

pkgname=tym
pkgver=2.1.0
pkgrel=1
pkgdesc="A tiny term for minimalists"
arch=('x86_64')
url="https://github.com/endaaman/tym"
license=('MIT')
depends=('vte3' 'lua' 'dbus-glib')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha1sums=('d3b4b9f6511dc2e8a0b82d555ac53cac3529b866')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
