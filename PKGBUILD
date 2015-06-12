# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=topcat
pkgver=4.2.3
_pkgver=4.2-3
pkgrel=1
pkgdesc="Tool for OPerations on Catalogues And Tables"
arch=('any')
url="http://www.star.bris.ac.uk/~mbt/topcat/"
depends=('java-environment' 'sh')
license=('GPL')
noextract=('topcat-full.jar')
source=("ftp://andromeda.star.bris.ac.uk/pub/star/topcat/v${_pkgver}/topcat-full.jar"
        "topcat" "tc3.gif")
md5sums=('a432b814b0b0c9952cd967ac111c4a82'
         '5f2df6a05c72b5641bf6a2b1c29173ed'
         '7ff53d3f87a464f70e5de7c8531cb2df')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -m644 "$srcdir"/topcat-full.jar "$pkgdir"/usr/share/java
  install -m755 "$srcdir"/topcat "$pkgdir"/usr/bin/topcat
  install -m755 "$srcdir"/tc3.gif "$pkgdir"/usr/share/pixmaps
}
