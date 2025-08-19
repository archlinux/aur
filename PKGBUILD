# Maintainer: Bastian Plettner <plettner [dot] bastian [atsign] gmail [dot] com>
# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=ski-ia64-simulator
pkgver=1.5.1
pkgrel=1
pkgdesc="Itanium 2 (ia64) instruction set simulator"
url="https://github.com/trofi/ski/"
arch=('x86_64')
license=('GPL2')
depends=('ncurses')
source=("https://github.com/trofi/ski/releases/download/v${pkgver}/ski-${pkgver}.tar.xz")
sha512sums=('f1a3960a8f5c3c7dc895332040a2e5060c9d510e41a3bc5de77b4e63c801af86b9fdff4e8c6cf94c74e1a842a9ff875b84f6f527894bbb855a37a00b480665cd')

build() {
	cd "${srcdir}/ski-${pkgver}"
	./configure --prefix="/usr"
	make
}

package() {
	cd "${srcdir}/ski-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
