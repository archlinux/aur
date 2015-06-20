# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=qml-extras
pkgver=0.0.5
pkgrel=1
pkgdesc="A UI framework for QtQuick implementing Material Design"
arch=("i686" "x86_64")
url="https://github.com/papyros/qml-extras"
license=("LGPL")
depends=("qt5-base-git" "qt5-declarative-git")
makedepends=("git")
provides=("$pkgname")
source=("$pkgname::git+https://github.com/papyros/qml-extras.git#tag=v$pkgver")
sha256sums=("SKIP")

prepare() {
	mkdir -p build
	cd build
	qmake "$srcdir/$pkgname"
	make
}

package() {
	cd build
	make INSTALL_ROOT="$pkgdir" install
}
