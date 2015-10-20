# Maintainer: John Maguire <contact@johnmaguire.me>
pkgname=libfxqmlcontrols
pkgver=0.1.0.233fbcb
pkgrel=1
pkgdesc="QML Controls library from FX"
arch=('i686' 'x86_64')
url="https://bitbucket.org/fx_/fx-qml-controls"
license=('GPL3')
makedepends=('git')
install="$pkgname.install"
source=("$pkgname::git+https://bitbucket.org/fx_/fx-qml-controls.git")

sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	echo 0.1.0.$(git log -1 --format="%h")
}

build() {
	cd "$srcdir/$pkgname/fxqmlcontrols"
	qmake fxqmlcontrols.pro
	make
}

package() {
	cd "$srcdir/$pkgname/fxqmlcontrols"
	make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}
