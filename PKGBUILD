# Maintainer: Yvaniak <ewen at philippot dot biz>
# Contributor: éclairevoyant

pkgname=nemo-qml-plugin-dbus
pkgver=2.1.33
pkgrel=1
pkgdesc="Provides types to access D-Bus from QML"
arch=(x86_64 aarch64)
url="https://github.com/sailfishos/$pkgname"
license=(LGPL2.1)
depends=(qt5-declarative)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('5ad3581d6ebb3bbab28c2a47017e93a4905e48dfe744e5890ce2e52fcf96182fb7a1bd48c6d3298e0f98821c5606b26f9d62942823553576ac5ebe7c7bc52bb9')

build() {
	cd $pkgname-$pkgver
	qmake src
	make
}

package() {
	make -C $pkgname-$pkgver INSTALL_ROOT="$pkgdir" install
}
