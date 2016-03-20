# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=qt5-qtstyleplugins
_pkgname=qtstyleplugins
pkgver=5.0.0
pkgrel=1
pkgdesc="Additional style plugins for Qt5"
arch=('i686' 'x86_64')
url="http://code.qt.io/cgit/qt/qtstyleplugins.git"
license=('LGPL')
depends=('qt5-base')
source=("http://download.qt.io/community_releases/additional_qt_src_pkgs/$_pkgname-src-$pkgver.tar.gz")
sha256sums=(9f96d8eb974944aa788c10e6ef610bf74b12b6dbd5257acacec78962b7753f40)

build() {
	cd $_pkgname-src-$pkgver
	qmake PREFIX=/usr LIBDIR=/usr/lib
	make
}

package() {
	cd $_pkgname-src-$pkgver
	make INSTALL_ROOT="$pkgdir" install
	rm -r "$pkgdir/usr/lib/cmake"
}
