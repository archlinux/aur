# Maintainer: Bastian Plettner <plettner [dot] bastian [atsign] gmail [dot] com>
# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=ski-ia64-simulator
pkgver=1.5.0
pkgrel=1
pkgdesc="Itanium 2 (ia64) instruction set simulator"
url="https://github.com/trofi/ski/"
arch=('x86_64')
license=('GPL2')
depends=('ncurses')
source=("https://github.com/trofi/ski/releases/download/v${pkgver}/ski-${pkgver}.tar.xz")
sha512sums=('c53c214c956ad33acf9a620813bf4f3342ea7a3672899cdc9804fa3ad2b6e36044fd65e214362b2cf5e57d1733523e186d63d88e24e54c761fc77cf5b63776c8')

build() {
	cd "${srcdir}/ski-${pkgver}"
	./configure --prefix="/usr"
	make
}

package() {
	cd "${srcdir}/ski-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
