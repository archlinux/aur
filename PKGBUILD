# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.3.4
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/scas'
source=("https://github.com/KnightOS/scas/archive/${pkgver}.tar.gz")
sha1sums=('f35611db2abf3c785a71aa3c04cade72eca13cb9')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
