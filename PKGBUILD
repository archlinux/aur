# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.3.2
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/scas'
source=("https://github.com/KnightOS/scas/archive/${pkgver}.tar.gz")
sha1sums=('9b12b3b8a7fdb33a69021d69f3ec8ccf3c527881')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
