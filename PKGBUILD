pkgname=nemo-qml-plugin-dbus
pkgver=2.1.25
pkgrel=1
pkgdesc="Provides types to access D-Bus from QML"
arch=("x86_64" "aarch64")
source=("https://github.com/sailfishos/nemo-qml-plugin-dbus/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("6440cac7221bf26a342b66cc1c262e7ce320e3fba200a8116a373c9de44ecf1f")
depends=("qt5-base")
license=("LGPL-2.1-only")

build() {
	cd "$pkgname-$pkgver"
	qmake src
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
