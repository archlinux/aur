# Maintainer: realroot <scorpion2185@protonmail.com>
# Former maintainer: Yvaniak <ewen at philippot dot biz>
# Contributor: éclairevoyant

pkgname=nemo-qml-plugin-dbus
pkgver=2.1.34
pkgrel=1
pkgdesc="Provides types to access D-Bus from QML"
arch=(x86_64 aarch64)
url="https://github.com/sailfishos/nemo-qml-plugin-dbus"
license=(LGPL2.1)
depends=(qt5-declarative)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('7bd9a07eeadc58e545b944218be071e9dd2724dd0f03a76df04fe78233997827c1162204a2fc8d0b54e19373e3ddb3858418a722ffd122579d25185802567b47')

build() {
	cd $pkgname-$pkgver
	qmake src
	make
}

package() {
	make -C $pkgname-$pkgver INSTALL_ROOT="$pkgdir" install
}
