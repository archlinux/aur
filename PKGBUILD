#
# PKGBUILD for ADFlib
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=adflib
pkgver=0.10.1
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
sha256sums=('e5a0a57ab9db6b4e14c519bfb2c35223b3ed2fb948ffeda03dd93070aaba4e57')


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
