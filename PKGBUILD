
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-widgets
pkgver=1.0
pkgrel=0
pkgdesc="Contemporary Widget Theme"
arch=("x86_64")
url="https://github.com/vicr123/contemporary-theme"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/contemporary-theme#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/lib/qt/plugins/styles/"
	cp "$pkgname-$pkgver/libContemporary.so" "$pkgdir/usr/lib/qt/plugins/styles/contemporary.so"
}
