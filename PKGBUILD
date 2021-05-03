# Maintainer: Stunts <stunts AT pinamartins DOT com>

pkgname=sambada
pkgver=0.8.3
pkgrel=1
pkgdesc="Detect associations between gentic data and environment variables"
arch=('i686' 'x86_64')
url="http://lasig.epfl.ch/sambada"
license=('GPL3')
source=("https://github.com/Sylvie/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c560e3cd3c1b8b1e178eafb4623f94831daff49e45a31dcdad11020ee51d28cd')

#prepare() {
#  cd ${srcdir}/${pkgname}-v${pkgver}-src
#  sed -i 's/journaltemporaire.h/JournalTemporaire.h/g' JournalTemporaire.cpp
#  sed -i 's/chronometre.h/Chronometre.h/g' Chronometre.cpp
#  sed -i 's/fluxsortie.h/FluxSortie.h/g' FluxSortie.cpp
#}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  cd build
  ../configure
  make
}

package() {
  install -D ${srcdir}/${pkgname}-${pkgver}/build/binaries/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -D ${srcdir}/${pkgname}-${pkgver}/build/binaries/supervision ${pkgdir}/usr/bin/supervision
  install -D ${srcdir}/${pkgname}-${pkgver}/build/binaries/recode-plink ${pkgdir}/usr/bin/recode-plink
  install -D ${srcdir}/${pkgname}-${pkgver}/build/binaries/recode-plink-lfmm ${pkgdir}/usr/bin/recode-plink-lfmm
}
