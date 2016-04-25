# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theterminal
pkgver=1.0
pkgrel=0
pkgdesc="Simple Terminal Emulator"
arch=("x86_64")
url="https://github.com/vicr123/theterminal"
license=('GPL2')
depends=('kwidgetsaddons' 'xdg-utils' 'qtermwidget')
makedepends=('qtchooser' 'git' 'clang')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theterminal#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/theterminal" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/theterminal.desktop" "$pkgdir/usr/share/applications"
}
