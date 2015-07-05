# Maintainer: George Eleftheriou <eleftg>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=sowing
pkgver=1.1.17
pkgrel=2
pkgdesc="Tools for documenting and improving portability"
arch=('any')
url="http://www.cs.uiuc.edu/~wgropp/projects/software/sowing"
license=('GPL')
source=('http://ftp.mcs.anl.gov/pub/sowing/sowing.tar.gz')
sha256sums=('fb6d76c02c9691c8abe652498283ef5d260cb2ec4d0ec7afaa7623aaa7de8bb8')

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  ../"${pkgname}-${pkgver}"/configure --prefix=/usr --datadir=/usr/share/sowing
  make
}

package() {
  cd "${srcdir}/build"
  make install prefix="${pkgdir}/usr" datadir="${pkgdir}/usr/share/sowing"
}
