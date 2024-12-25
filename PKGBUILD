# Maintainer: realroot <scorpion2185@protonmail.com>
# Former maintainer: Yvaniak <ewen at philippot dot biz>
# Contributor: éclairevoyant

pkgname=nemo-qml-plugin-dbus
pkgver=2.1.35
pkgrel=1
pkgdesc="Provides types to access D-Bus from QML"
arch=(x86_64 aarch64)
url="https://github.com/sailfishos/nemo-qml-plugin-dbus"
license=(LGPL2.1)
depends=(qt5-declarative)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('8e2d9aa521ea0b7b6adf38bfbf1185241f0d3f8ebab20cd2ffee23f8149043afd6306b9ad339f1ae295fb39054173c729babfc6364b14eaeafc6b16a7b5ad138')

build() {
	cd $pkgname-$pkgver
	qmake src
	make
}

package() {
	make -C $pkgname-$pkgver INSTALL_ROOT="$pkgdir" install
}
