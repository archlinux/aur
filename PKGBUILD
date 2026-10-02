# Maintainer: Beej Jorgensen <beej@beej.us>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: sp42b <sp42b|a_t|gmx.net>

pkgname=cavez-of-phear
pkgver=0.6.2
pkgrel=1
pkgdesc="A Boulder Dash like game for consoles/terminals. Level editor included."
arch=('i686' 'x86_64')
url="https://github.com/AMDmi3/cavezofphear"
options=(!debug)
license=('GPL-3.0-only')
depends=('ncurses')
makedepends=('cmake' 'help2man')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AMDmi3/cavezofphear/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('32f8d535b3bbd6d037371ff80127f02dfb7ef4eca066c753efff1e09c28030af')

build() {
	cmake -S "cavezofphear-${pkgver}" -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSTEMWIDE=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
