pkgname=nemo-qml-plugin-dbus
pkgver=2.1.28
pkgrel=1
pkgdesc="Provides types to access D-Bus from QML"
url="https://github.com/sailfishos/nemo-qml-plugin-dbus"
arch=("x86_64" "aarch64")
source=("https://github.com/sailfishos/nemo-qml-plugin-dbus/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7b93a5d2a537bd5a2afec48cb3877ee7f690e09667a940261e663a5ca7b3f858')
depends=("qt5-base" "qt5-declarative")
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
