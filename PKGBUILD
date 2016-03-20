# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.2.2
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/scas'
source=("https://github.com/KnightOS/scas/archive/${pkgver}.tar.gz")
sha1sums=('6c74769a526155cd8b2d0b4f2ad6602411986af1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
