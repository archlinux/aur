# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-kcc
_pkgname=kcc
pkgver=3.8.2
pkgrel=1
license=('GPL')
pkgdesc='A C compiler for z80 systems'
depends=("scas" "boost")
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/kcc'
source=("https://github.com/KnightOS/kcc/archive/${pkgver}.tar.gz")
sha1sums=('06868d12488b48d73cdf8bb4bde7e891aa9b3a48')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	DESTDIR="$pkgdir/" make install
}
