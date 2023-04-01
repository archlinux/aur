# Maintainer: éclairevoyant

_pkgname=DOtherSide
pkgname=dotherside
pkgver=0.9.0
pkgrel=1
pkgdesc='C library for creating bindings to Qt QML'
arch=(x86_64)
url="https://github.com/filcuc/$_pkgname"
license=(LGPL3)
depends=(qt6-declarative)
makedepends=(cmake doxygen git graphviz)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('4b656f0fe7f7377a9aa6d053802dbf3f126f29da3388fb3265b916f7513050aee33fd0426ea2a3ebaf1cc756f4c8e511216be5fd51fc30097a72d0461968cddd')

build() {
	cmake -B build -S $pkgname-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
