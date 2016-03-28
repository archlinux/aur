# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-terminal
pkgver=0.6.90
pkgrel=1
pkgdesc="The Hawaii Terminal Emulator"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org/"
license=('GPL2')
depends=('qt5-declarative' 'qt5-quickcontrols')
makedepends=('extra-cmake-modules')
conflicts=('hawaii-terminal-git')
groups=('hawaii')
#source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
source=("https://codeload.github.com/hawaii-desktop/${pkgname}/legacy.tar.gz/1937e860483cf4cce7f3388be7457b7d2cdeeb4a")
sha1sums=('c9007e7d08b53d81c33cf4e748741e129b1262e4')

prepare() {
	mkdir -p build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../hawaii-desktop-hawaii-terminal-1937e86 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=Release
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
