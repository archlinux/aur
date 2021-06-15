# Maintainer: Paolo De Donato <dedonato95@hotmail.it>
pkgname=stringsuite
pkgver=2.0
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
sha256sums=('09aa1400029627d76fe2ae34c0e696756f9cca5dbda0029369d1978581ab25bf')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

build() {
	cmake -S "$srcdir/StringSuite-${pkgver}/src" -B build
	cmake --build build
}

package() {
	cmake --install build --prefix "$pkgdir/usr"
}
