# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.1.2
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/scas'
source=("https://github.com/KnightOS/scas/archive/${pkgver}.tar.gz")
sha1sums=('e6649f01a3b825eb6a65d552aed23011bb556319')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DINSTRUCTION_SET_PATH=/usr/share/scas/instruction_sets/ -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
