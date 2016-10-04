
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-bt
pkgver=1.3
pkgrel=0
pkgdesc="Bluetooth Management for theShell using BlueZ"
arch=("x86_64")
url="https://github.com/vicr123/ts-bt"
license=('GPL3')
depends=('bluez-qt' 'qt5-base')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/ts-bt#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/ts-bt" "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/ts-bt.desktop" "$pkgdir/usr/share/applications"
}
