# Maintainer: Seweryn Pajor <archdevx7d6@sewe-hub.xyz>
pkgname=opentimer
pkgver='0.0.1'
pkgrel=1
pkgdesc="A fast and minimal speedcubing timer written in Qt5"
arch=(x86_64)
license=('GPL')
depends=(qt5-base)
changelog=
url="https://github.com/sewe2000/opentimer/archive/refs/tags/0.0.1.tar.gz"
source=($url)
sha256sums=('ffd05773bd9a0ce0d3d9beaf13c1a6ba77154118e47b818300999161b5eb68bf')
validpgpkeys=()

prepare() {
	wget $url -O "$pkgname-$pkgver.tar.gz"
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	qmake -config release
	make
}

package() {
	cd "$pkgname-$pkgver"
	qmake -install qinstall -exe opentimer $pkgdir/usr/bin/$pkgname
}
