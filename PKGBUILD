# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-kcc
_pkgname=kcc
pkgver=4.0.0
pkgrel=1
license=('GPL')
pkgdesc='A C compiler for z80 systems'
depends=("scas" "boost")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/kcc'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/kcc/archive/$pkgver.tar.gz")
sha256sums=('e67e65cf81ecf3769b86f84694018083994640a478fa53cf05fd3e8b9d108527')

build() {
	cd "$_pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	DESTDIR="$pkgdir/" make install
}
