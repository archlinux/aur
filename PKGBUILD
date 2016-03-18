# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.2.1
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/scas'
source=("https://github.com/KnightOS/scas/archive/${pkgver}.tar.gz")
sha1sums=('d2c164a57c37c600055af50e03278436b112014a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
