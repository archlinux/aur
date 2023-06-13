# Maintainer: Bastian Plettner <plettner [dot] bastian [atsign] gmail [dot] com>
# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=ski-ia64-simulator
pkgver=1.4.0
pkgrel=1
pkgdesc="Itanium 2 (ia64) instruction set simulator"
url="https://github.com/trofi/ski/"
arch=('x86_64')
license=('GPL2')
depends=('ncurses')
source=("https://github.com/trofi/ski/releases/download/v${pkgver}/ski-${pkgver}.tar.xz")
sha512sums=('855bc73c2cd93d890cd532db524eecc122d5f3eddf189efdbf34069d1c9bd7b7f98d5e593387fdc31b38fc8630f00b6b126f5c1a1f22dab57447e024b9015cf5')

build() {
	cd "${srcdir}/ski-${pkgver}"
	./configure --prefix="/usr"
	make
}

package() {
	cd "${srcdir}/ski-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
