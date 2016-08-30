
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-bt
pkgver=1.2
pkgrel=0
pkgdesc="Bluetooth Management for theShell using BlueZ"
arch=("x86_64")
url="https://github.com/vicr123/ts-bt"
license=('GPL3')
depends=('bluez-qt')
makedepends=('qtchooser' 'git')
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
