# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>

pkgname=ddwarf
pkgver=0.83
pkgrel=2
pkgdesc="Digger Dwarf is a console-based gopher client"
license=("GPL")
source=("http://www.viste-family.net/mateusz/software/ddwarf/ddwarf083-src.zip")
arch=('i686' 'x86_64')
makedepends=('freebasic')
url="http://www.viste-family.net/mateusz/software/ddwarf/"
sha256sums=('03b6acdd16bcc44bf36e38ba8aab5fa21509703422c0c0b9c8cd466dadcee5a5')

build() {
  echo "Building chisock"
  cd "$srcdir/chisock"
  fbc *.bas -g -mt -lib -x libchisock.a

  echo "Building ddwarf"
  cd "$srcdir"
  cp ./chisock/libchisock.a .
  fbc -mt ddwarf.bas
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/ddwarf" "$pkgdir/usr/bin"
  chmod a+x "$pkgdir/usr/bin/ddwarf"
}

