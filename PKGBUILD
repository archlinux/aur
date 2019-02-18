# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-kcc
_pkgname=kcc
pkgver=4.0.0
pkgrel=1
license=('GPL')
pkgdesc='A C compiler for z80 systems'
depends=("scas" "boost")
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/kcc'
source=("https://github.com/KnightOS/kcc/archive/${pkgver}.tar.gz")
sha1sums=('6f3460eee2af9dba6fea3f7273668a5798ce6aac')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
