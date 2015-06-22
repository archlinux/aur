#
# PKGBUILD for unadf
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=unadf
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="unzip like tool for Commodore Amiga filesystem .ADF images"
arch=('i686', 'x86_64')
_pkgname=ADFlib
_pkgver=0.7.12
url="http://lclevy.free.fr/adflib/unadf.html"
license=('GPL')
groups=()
depends=('glibc' 'adflib')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/tonigi/${_pkgname}/archive/${_pkgver}.tar.gz)
noextract=()
md5sums=('af11dbb3f79ef799538c9f03cd5a40cd')


prepare() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  sh autogen.sh
  #sh configure --prefix="${_pkgdir}/"
  sh configure
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}/" install-exec
  rm -rf "${pkgdir}/usr/local/lib/"
}

# EOF
