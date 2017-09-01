# Maintainer: Ken Enda <buhibuhidog@gmail.com>

pkgname=tym
pkgver=1.0.1
pkgrel=1
pkgdesc="A tiny term for minimalists"
arch=('x86_64')
url="https://github.com/endaaman/tym"
license=('MIT')
depends=('vte3' 'lua')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha1sums=('e7e2105aac7ce4c96e017007a5f363b8dde56522')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
