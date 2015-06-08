# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-kcc
_pkgname=kcc
pkgver=3.5.1
pkgrel=1
license=('GPL')
pkgdesc='A C compiler for z80 systems'
depends=("scas")
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/kcc'
source=("https://github.com/KnightOS/kcc/archive/${pkgver}.tar.gz")
sha1sums=('05c0417b97d6187a9057aa99572dd5ed1ecffd2c')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
