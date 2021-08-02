# Maintainer: Paolo De Donato <dedonato95@hotmail.it>
pkgname=stringsuite
pkgver=2.1
pkgrel=1
pkgdesc="Suite to work with strings with different encodings"
arch=('any')
url="https://github.com/Loara/StringSuite"
license=('LGPL3')
groups=()
depends=()
makedepends=('cmake>=3.20') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Loara/StringSuite/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('06a7d798954059f2eed160acb6aa99c4cd11c997b276d859a359a9abe206ce3e')

#  Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

build() {
	cmake -S "$srcdir/StringSuite-${pkgver}/src" -B build
	cmake --build build
}

package() {
	cmake --install build --prefix "$pkgdir/usr"
}
