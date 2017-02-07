
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the-libs
pkgver=1.2
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/vicr123/the-libs"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/the-libs#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	mkdir -p "$pkgdir/usr/lib/"
	cp "$pkgname-$pkgver/"*.so* "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/lib/qt/mkspecs/modules/"
	cp "$pkgname-$pkgver/qt_thelib.pri" "$pkgdir/usr/lib/qt/mkspecs/modules/"
	mkdir -p "$pkgdir/usr/include/the-libs/"
	cp "$pkgname-$pkgver/"*.h "$pkgdir/usr/include/the-libs/"
}
