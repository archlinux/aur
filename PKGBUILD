#
# PKGBUILD for ADFlib
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=adflib
pkgver=0.10.2
pkgrel=1
epoch=
pkgdesc="A free, portable and open implementation of the Commodore Amiga filesystem - including the unadf tool"
arch=('i686' 'x86_64')
_pkgname=ADFlib
_pkgver=${pkgver}
url="http://lclevy.free.fr/adflib/adflib.html"
license=('GPL-2.0-or-later')
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
sha256sums=('1181cda574fcc87ba6564d519ecf58f63fbc468e0bd408485471ffa2e9745c5c')


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
