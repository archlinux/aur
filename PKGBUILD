# Maintainer: Xyne
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgname=inchi
pkgver=1.05
_pkgver=105
pkgrel=1
pkgdesc="IUPAC InChI utility"
arch=('i686' 'x86_64')
url="http://www.iupac.org/inchi/"
license=('LGPL')
makedepends=('gcc' 'make')
source=("http://www.inchi-trust.org/download/${_pkgver}/INCHI-1-"{SRC,DOC}".zip")

build() {
  cd "$srcdir/INCHI-1-SRC/INCHI_EXE/inchi-1/gcc/"
  make
}

package() {
  install -Dm755 "$srcdir/INCHI-1-SRC/INCHI_EXE/bin/Linux/inchi-1" "$pkgdir/usr/bin/inchi-1"

  cd "$srcdir/INCHI-1-DOC"
  for pdf in *.pdf; do
    install -Dm644 "$pdf" "$pkgdir/usr/share/doc/inchi-1/$pdf"
  done
}

sha512sums=('10c496ef3a1b91c74fd7e450a5af5b84083d93648ad1517a175ad16af324fa5e6ce61e90b1421c5c2f3f8724e0312060bc57c27012c86edcf02f896249852066'
            'ff35affb642f3122b9d9ade9d5ada4af9a8dab2941b79970f92284e8bb9a60728dfbec4851ccf041e52de53067861887b0f6496471327f48ebbe8be0eb37e462')
