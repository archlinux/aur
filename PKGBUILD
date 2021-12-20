# Maintainer: Paolo De Donato <dedonato95@hotmail.it>
pkgname=stringsuite
pkgver=3.0
pkgrel=1
pkgdesc="Suite to work with strings with different encodings"
arch=('x86_64')
url="https://github.com/Loara/StringSuite"
license=('LGPL3')
groups=()
depends=()
makedepends=('cmake>=3.20')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Loara/StringSuite/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('11d5af29891b44436a89225c9f054d04ce85076e1d261507d6d8809bb9dd9650')

# Release already provides -O2 optimization

build() {
	cmake -B build -S "StringSuite-${pkgver}/src"
	cmake -DCMAKE_BUILD_TYPE="Release" build
	cmake --build build
}

package() {
	cmake --install build --prefix "$pkgdir/usr"
}
