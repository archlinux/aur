# Maintainer: Penguin <penguin@pcland.co.in>
pkgname=wikilynx
pkgver=1.5.6
pkgrel=3
#epoch=
pkgdesc="A simple Qt C++ app to play Wikipedia Speedruns the right way"
arch=('any')
url="https://github.com/flamboyantpenguin/wikilynx"
license=('MIT')
depends=(
	'qt6-base'
	'qt6-webengine'
	'qt6-svg'
	'qt6-multimedia'
	'qt6-multimedia-gstreamer'
)
makedepends=(
	'cmake'
	'git'
	'base-devel'
)
#optdepends=()
conflicts=("${pkgname}")
provides=("${pkgname}")
#changelog=
source=("https://github.com/flamboyantpenguin/wikilynx/archive/refs/tags/v1.5.6.zip")
sha256sums=('4143b88587eeaef026c4a3760c918a6bf587f5334032a885ea01ac4cf8406ef6')
validpgpkeys=()

build() {

	cd "wikilynx-${pkgver}/wikiLYNX"
	cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
	make

}

package() {
	
	cd "wikilynx-${pkgver}/wikiLYNX"
	make install

}
