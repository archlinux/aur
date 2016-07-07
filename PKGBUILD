# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=topcat
pkgver=4.3.3
_pkgver=4.3-3
pkgrel=1
pkgdesc="Tool for OPerations on Catalogues And Tables"
arch=('any')
url="http://www.star.bris.ac.uk/~mbt/topcat/"
depends=('java-environment' 'sh')
license=('GPL')
noextract=('topcat-full.jar')
source=("ftp://andromeda.star.bris.ac.uk/pub/star/topcat/v${_pkgver}/topcat-full.jar"
        "topcat" "topcat.png" "topcat.desktop")
md5sums=('9faad3b9fc8f91d1183f2d0f65802c40'
         '5f2df6a05c72b5641bf6a2b1c29173ed'
         '787868860ed7b0cc70595fa96dbff3da'
         'c00fecfd325398c2bcbd08ac76456c6e')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -m644 "$srcdir"/topcat-full.jar "$pkgdir"/usr/share/java
  install -m755 "$srcdir"/topcat "$pkgdir"/usr/bin/topcat
  install -m755 "$srcdir"/topcat.png "$pkgdir"/usr/share/pixmaps
  install -m755 "$srcdir"/topcat.desktop "$pkgdir"/usr/share/applications
}
