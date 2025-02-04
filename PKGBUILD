# Maintainer: robertfoster

pkgname=openicc
pkgver=1.3.1
pkgrel=1
pkgdesc="Colour management projects to share ICC related implementation details"
url="http://www.freedesktop.org/wiki/OpenIcc"
arch=('i686' 'x86_64')
depends=('xorg-server')
source=("http://downloads.sourceforge.net/project/openicc/OpenICC-Profiles/icc-profiles-${pkgname}-${pkgver}.tar.bz2")
license=('GPL')

build() {
  cd "${srcdir}/icc-profiles-${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}
package() {
  cd "${srcdir}/icc-profiles-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('a6a8b3b1153faa3a84e71ed81206b19335902fae5f7dee5427a381f4983c217d')
