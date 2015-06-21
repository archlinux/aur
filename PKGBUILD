# Maintainer: Xyne
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgname=inchi
pkgver=1.04
pkgrel=2
pkgdesc="IUPAC InChI utility"
arch=('i686' 'x86_64')
url="http://www.iupac.org/inchi/"
license=('LGPL')
makedepends=('gcc' 'make')
source=('http://www.inchi-trust.org/wp/wp-content/uploads/2014/06/INCHI-1-'{API,DOC}'.zip')

build() {
  cd "$srcdir/INCHI-1-API/INCHI/gcc/inchi-1"
  make
}

package() {
  install -Dm755 "$srcdir/INCHI-1-API/INCHI/gcc/inchi-1/inchi-1" "$pkgdir/usr/bin/inchi-1"

  cd "$srcdir/INCHI-1-DOC"
  for pdf in *.pdf; do
    install -Dm644 "$pdf" "$pkgdir/usr/share/doc/inchi-1/$pdf"
  done
}

md5sums=('8447bf108af12fe66eecba41bbc89918'
         '4b438cc7da7472577307a2063414c973')
