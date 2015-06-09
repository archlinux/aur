# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=sambada
pkgver=0.5.1
pkgrel=1
pkgdesc="Detect associations between gentic data and environment variables"
arch=('i686' 'x86_64')
url="http://lasig.epfl.ch/sambada"
license=('GPL3')
depends=('')
source=("http://lasig.epfl.ch/files/content/sites/lasig/files/${pkgname}/${pkgname}-v${pkgver}-src.tar.gz")
md5sums=('a6a35f1f4fdbf2db652cab945482939b')

prepare() {
  cd ${srcdir}/${pkgname}-v${pkgver}-src
  sed -i 's/journaltemporaire.h/JournalTemporaire.h/g' JournalTemporaire.cpp
  sed -i 's/chronometre.h/Chronometre.h/g' Chronometre.cpp
  sed -i 's/fluxsortie.h/FluxSortie.h/g' FluxSortie.cpp
}

build() {
  cd ${srcdir}/${pkgname}-v${pkgver}-src
  make
}

package() {
  install -D ${srcdir}/${pkgname}-v${pkgver}-src/binaries/Sambada-v${pkgver} $pkgdir/usr/bin/${pkgname}
  install -D ${srcdir}/${pkgname}-v${pkgver}-src/binaries/Supervision-v${pkgver} $pkgdir/usr/bin/supervision
  install -D ${srcdir}/${pkgname}-v${pkgver}-src/binaries/RecodePlink-v${pkgver} $pkgdir/usr/bin/RecodePlink
  install -D ${srcdir}/${pkgname}-v${pkgver}-src/binaries/RecodePlink_LFMM-v${pkgver} $pkgdir/usr/bin/RecodePlink_LFMM
}
