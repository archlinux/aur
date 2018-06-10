
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-qtplatform
pkgver=1.8.1
pkgrel=0
pkgdesc="Qt Platform Abstraction for theShell"
arch=("x86_64")
url="https://github.com/vicr123/ts-qtplatform"
license=('GPL3')
depends=('qt5-base' 'contemporary-widgets' 'kiconthemes' 'ttf-contemporary' 'contemporary-icons' 'qt5-multimedia' 'contemporary-cursors' 'libxcursor')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/ts-qtplatform#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	#mkdir -p "$pkgdir/usr/lib/qt/plugins/platformthemes/"
	#cp "$pkgname-$pkgver/libts-qtplatform.so" "$pkgdir/usr/lib/qt/plugins/platformthemes/ts.so"
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
