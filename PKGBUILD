# Maintainer: John Maguire <contact@johnmaguire.me>
pkgname=libfxqmlhelpers
pkgver=0.1.0.46aa9d6
pkgrel=2
pkgdesc="QML Controls library from FX"
arch=('i686' 'x86_64')
url="https://bitbucket.org/fx_/fx-qml-helpers"
license=('GPL3')
makedepends=('git')
install="$pkgname.install"
source=("$pkgname::git+https://bitbucket.org/fx_/fx-qml-helpers.git")

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	echo 0.1.0.$(git log -1 --format="%h")
}

build() {
	cd "$srcdir/$pkgname/fxqmlhelpers"
	qmake fxqmlhelpers.pro
	make
}

package() {
	cd "$srcdir/$pkgname/fxqmlhelpers"
	make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}
