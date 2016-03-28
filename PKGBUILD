# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-widget-styles
pkgver=0.6.90.20160327
pkgrel=1
pkgdesc="Hawaii widget styles"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://hawaiios.org"
license=('LGPL')
depends=('qt5-quickcontrols')
makedepends=('extra-cmake-modules')
conflicts=('hawaii-widget-styles-git')
groups=('hawaii')
#source=("https://github.com/hawaii-desktop/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
source=("https://codeload.github.com/hawaii-desktop/${pkgname}/legacy.tar.gz/20ffdadd04e9f98124ea14690fdf89d7567956c2")
sha1sums=('5078f7b5c420d323a9da8acef7ce1449a5750a46')

prepare() {
	mkdir -p build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../hawaii-desktop-hawaii-widget-styles-20ffdad \
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
