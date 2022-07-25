# Maintainer: Vadim Vardanyan <shitcoder@riseup.net>

pkgname=wayclip
pkgver=0.3
pkgrel=1
pkgdesc='Wayland clipboard utility'
arch=('x86_64')
url='https://git.sr.ht/~noocsharp/wayclip'
license=('ISC')
depends=('wayland')
makedepends=('wayland')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~noocsharp/wayclip/archive/$pkgver.tar.gz")
b2sums=('b82c86536ee95403b7f3b8885e45ab1b2bf68dd3b639e30a1f84986894156b00bf70ac0facbfc1e087cf494ea1336737a79c702cd2580acc608b64927639828f')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
