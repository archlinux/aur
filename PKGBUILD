# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=falltergeist
pkgver=0.4.0
pkgrel=1
pkgdesc='Opensource Fallout game engine written in C++ and SDL'
arch=(x86_64)
url=https://falltergeist.org
license=(GPL3)
depends=(sdl2 sdl2_image sdl2_mixer zlib glew glm)
makedepends=(cmake)
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/falltergeist/falltergeist/archive/refs/tags/"${pkgver}".tar.gz)
sha256sums=('b97a9c293f3e6e435d23cab496ec0e00ce60f785afddc27f8837f3f87a5059ff')

build() {
	cmake -B build -S "${pkgname}"-"${pkgver}" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
