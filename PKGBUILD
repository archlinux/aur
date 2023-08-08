#
# PKGBUILD for ADFlib
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=adflib
pkgver=0.8.0
pkgrel=3
epoch=
pkgdesc="A free, portable and open implementation of the Commodore Amiga filesystem - including the unadf tool"
arch=('i686' 'x86_64')
_pkgname=ADFlib
_pkgver=${pkgver}
url="http://lclevy.free.fr/adflib/adflib.html"
license=('GPL')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('unadf')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/lclevy/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz)
noextract=()
sha256sums=('fa78b6cd1139985c16702b3e64614f5721aa63bb0a060969a92c2e8fc52dd3ed')


prepare() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  sh autogen.sh
  sh configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# EOF
