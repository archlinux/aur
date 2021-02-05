# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-kcc
_pkgname=kcc
pkgver=4.0.2
pkgrel=2
license=('GPL')
pkgdesc='A C compiler for z80 systems'
groups=("knightos")
depends=("scas" "boost")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/kcc'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/kcc/archive/$pkgver.tar.gz")
sha256sums=('8fe34702ea51e92213cc37636878582eaa8c4ff5616e14c4f4b066c0b828296b')

build() {
	cd "$_pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	DESTDIR="$pkgdir/" make install
}
