pkgname=PlastikStyle
pkgver=1.0.4
pkgrel=0
license=(LGPL-2.1-or-later)
pkgdesc="QStyle for qt5 and qt6 providing the look of KDE3's plastik"
arch=(x86_64)
url=https://github.com/MartinF99/PlastikStyle
source=('https://github.com/MartinF99/PlastikStyle/archive/refs/tags/1.0.4.tar.gz')
sha256sums=('dc5a37645f1242d07275ae513ef4d134c5f2e3c15a8b549e8038789f6396f28f')
makedepends=(qt5-tools
			qt6-tools
			cmake)
depends=(qt5-base qt6-base)

build(){
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}
package(){
	cd "$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" make install
}
