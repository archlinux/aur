# Maintainer: Ken Enda <buhibuhidog@gmail.com>

pkgname=tym
pkgver=3.1.2
pkgrel=1
pkgdesc="A tiny term for minimalists"
arch=('x86_64')
url="https://github.com/endaaman/tym"
license=('MIT')
depends=('vte3' 'lua53')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha1sums=('2defe4b752fbb3229bd928b89c855900530df43e')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
