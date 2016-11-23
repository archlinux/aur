
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thecalculator
pkgver=1.0
pkgrel=0
pkgdesc="Powerful Calculator"
arch=("x86_64")
url="https://github.com/vicr123/thecalculator"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thecalculator#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/thecalculator" "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/thecalculator.desktop" "$pkgdir/usr/share/applications"
}
