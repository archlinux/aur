# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: <deleted-account>

pkgname=wayclip
pkgver=0.4.2
pkgrel=1
pkgdesc="Wayland clipboard utility"
arch=('x86_64')
url="https://git.sr.ht/~noocsharp/wayclip"
license=('ISC')
depends=('wayland')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~noocsharp/wayclip/archive/$pkgver.tar.gz")
b2sums=('6db6a32511a0fdfa175e98f48ba79471bf50548fa681a7df0f4b5f434fc39457cf1c02f2fd3bbdf96022e511857077dcd363bc87b1f0ba74bbd43613b4940b6c')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
