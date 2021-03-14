# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: João Freitas <joaj.freitas at gmail dot com>
pkgname=plotjuggler
pkgver=3.1.0
pkgrel=1
epoch=
pkgdesc=""
arch=(x86_64)
url="https://github.com/facontidavide/PlotJuggler"
license=('LGPL3')
groups=()
depends=(qt5-base qt5-websockets)
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/facontidavide/PlotJuggler/archive/$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd PlotJuggler-"$pkgver"
	mkdir -p build
	cd build
	cmake ..
	make
}

package() {
	cd PlotJuggler-"$pkgver"/build
	make DESTDIR=${pkgdir} install
}
