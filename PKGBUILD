# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: João Freitas <joaj.freitas at gmail dot com>
pkgname=plotjuggler
pkgver=3.6.1
pkgrel=1
epoch=
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=(x86_64)
url="https://github.com/facontidavide/PlotJuggler"
license=('MPL-2.0')
groups=()
depends=(binutils qt5-base qt5-multimedia qt5-svg qt5-websockets arrow)
makedepends=(cmake clang)
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
