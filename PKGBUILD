# Maintainer: Penguin <penguin@pcland.co.in>
pkgname=wikilynx
pkgver=1.5.6
pkgrel=1
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
sha256sums=('8e20e42067b719b8742a3e499f06ce87fb02fed6c5aaa25cbbe10d5f1ff29569')
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
