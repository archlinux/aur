# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-wallpapers
pkgver=0.6.90.20160327
pkgrel=1
pkgdesc="Wallpapers for the Hawaii desktop environment"
arch=('any')
url="https://github.com/hawaii-desktop"
license=('GPL')
makedepends=('extra-cmake-modules')
conflicts=('hawaii-wallpapers-git')
groups=('hawaii')
#source=("https://github.com/hawaii-desktop/${pkgname}/archive/v${pkgver}.tar.gz")
source=("https://codeload.github.com/hawaii-desktop/${pkgname}/legacy.tar.gz/ffca94dc6917ba0109dbd837cc3579fd0cde6357")
sha1sums=('b0700541a250aee1ac160523440f3d7b034295ec')

prepare() {
	mkdir build
}

build() {
	cd build
	#cmake ../${pkgname}-${pkgver} \
	cmake ../hawaii-desktop-hawaii-wallpapers-ffca94d/ \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
