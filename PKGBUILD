# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=qml-material
pkgver=0.0.5
pkgrel=2
pkgdesc="A UI framework for QtQuick implementing Material Design"
arch=("i686" "x86_64")
url="https://github.com/papyros/qml-material"
license=("LGPL")
depends=("qt5-base-git" "qt5-declarative-git" "qt5-quickcontrols-git" "qt5-svg-git" 
		 "qt5-graphicaleffects-git" "qml-extras")
makedepends=("git")
provides=("$pkgname")
source=("$pkgname::git+https://github.com/papyros/qml-material.git#tag=v$pkgver")
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
