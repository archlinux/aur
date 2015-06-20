# Maintainer: Michael Spencer <sonrisesoftware@gmail.com>

pkgname=papyros-files
pkgver=0.0.5
pkgrel=2
pkgdesc="The file manager for Papyros"
arch=("i686" "x86_64")
url="https://github.com/papyros/files-app"
license=("LGPL")
depends=("qt5-declarative-git" "qt5-graphicaleffects-git" "kdeclarative" "qml-material" "taglib")
makedepends=("git" "cmake" "intltool")
provides=("$pkgname")
source=("$pkgname::git+https://github.com/papyros/files-app.git#tag=v$pkgver")
sha256sums=("SKIP")

prepare() {
	mkdir -p build
	cd build
	cmake "$srcdir/$pkgname"
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
