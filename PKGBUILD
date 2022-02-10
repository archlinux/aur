# Maintainer: Xyne
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgname=inchi
pkgver=1.06
_pkgver=106
pkgrel=1
pkgdesc="IUPAC InChI utility"
arch=('i686' 'x86_64')
url="http://www.iupac.org/inchi/"
license=('LGPL')
makedepends=('gcc' 'make')
source=("http://www.inchi-trust.org/download/${_pkgver}/INCHI-1-"{SRC,DOC}".zip")
sha512sums=('56248030f30b0fa065cb783353cc9eab0da0e39b580a54120e9fca0a2ad8a0cfc85da1ea81b6231e48cfd59a3a5d81e1c6310778d913c21ec3f2e72d6a7fad8a'
            'df31014d21d46498e3bcde85d8c782a23193225e8d3b6ba7f6e31816c935c8ea1a60b2472fb0cd81733a47ae71918de973324ccd20a49fea3808bdfed92e6850')

build() {
  cd "$srcdir/INCHI-1-SRC/INCHI_EXE/inchi-1/gcc/"
  make
}

package() {
  install -Dm755 "INCHI-1-SRC/INCHI_EXE/bin/Linux/inchi-1" "$pkgdir/usr/bin/inchi-1"

  cd "INCHI-1-DOC"
  for pdf in *.pdf; do
    install -Dm644 "$pdf" "$pkgdir/usr/share/doc/inchi-1/$pdf"
  done
}

