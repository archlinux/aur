# Maintainer: Ken Enda <buhibuhidog@gmail.com>

pkgname=tym
pkgver=2.1.2
pkgrel=1
pkgdesc="A tiny term for minimalists"
arch=('x86_64')
url="https://github.com/endaaman/tym"
license=('MIT')
depends=('vte3' 'lua')
source=("https://github.com/endaaman/${pkgname}/releases/download/$pkgver/${pkgname}-$pkgver.tar.gz")
sha1sums=('0891ed7cae46d957442dbf33f4097aa370fdee49')
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
