# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-system-preferences
pkgver=0.6.90.20160327
pkgrel=1
pkgdesc="Hawaii system preferences"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org"
license=('GPL')
depends=('fluid' 'libhawaii' 'polkit-qt5' 'libkscreen' 'xkeyboard-config')
conflicts=('hawaii-system-preferences')
replaces=('hawaii-system-preferences')
provides=('hawaii-system-preferences')
makedepends=('extra-cmake-modules' 'qt5-tools')
conflicts=('hawaii-system-preferences-git')
groups=('hawaii')
options=('debug')
#source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
source=("https://codeload.github.com/hawaii-desktop/${pkgname}/legacy.tar.gz/2da9bf560c2fe2b17316ac991cbdc4d969cf26a7")
sha1sums=('6d1fd181d089c33be2e42639b204d96475e552c6')

prepare() {
	mkdir -p build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../hawaii-desktop-hawaii-system-preferences-2da9bf5 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DLIBEXEC_INSTALL_DIR=lib \
		-DQML_INSTALL_DIR=lib/qt/qml \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
