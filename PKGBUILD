# Maintainer: Vadim Vardanyan <shitcoder@riseup.net>

pkgname=wayclip
pkgver=0.4.1
pkgrel=1
pkgdesc="Wayland clipboard utility"
arch=('x86_64')
url="https://git.sr.ht/~noocsharp/wayclip"
license=('ISC')
depends=('wayland')
makedepends=('wayland')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~noocsharp/wayclip/archive/$pkgver.tar.gz")
b2sums=('8e23cfeff510c23279002802f0ba04a30ec0201308fa29be99cdefe04b2d1eb25bb4b6eef1c6823427f85fd9194f36e5e496e425b43ff5833aadeb70c6259105')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
