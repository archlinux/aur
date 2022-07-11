# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>

pkgname=minised
pkgver=1.16
pkgrel=2
pkgdesc="Smaller, faster sed implementation"
arch=('x86_64')
url="https://exactcode.com/site/open_source/minised/"
license=('custom:BSD-like')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://dl.exactcode.de/oss/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('46e072d5d45c9fd3d5b268523501bbea0ad016232b2d3f366a7aad0b1e7b3f71')

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
