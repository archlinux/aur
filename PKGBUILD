# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=topcat
pkgver=4.8.5
_pkgver=4.8-5
pkgrel=1
pkgdesc="Tool for OPerations on Catalogues And Tables"
arch=('any')
url="http://www.star.bris.ac.uk/~mbt/topcat/"
depends=('java-runtime' 'sh')
license=('GPL')
noextract=('topcat-full.jar')
source=("topcat-full-${pkgver}.jar::http://andromeda.star.bristol.ac.uk/releases/topcat/v${_pkgver}/topcat-full.jar"
        "https://raw.githubusercontent.com/Starlink/starjava/master/topcat/src/docs/tclogo.svg"
        "topcat" "topcat.desktop")
md5sums=('b32892e37a61f2606d310b4370ab5c1f'
         'a8df7717765aa85d16dfbf296ea8d76e'
         '5f2df6a05c72b5641bf6a2b1c29173ed'
         'c00fecfd325398c2bcbd08ac76456c6e')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -m644 "$srcdir"/topcat-full-${pkgver}.jar "$pkgdir"/usr/share/java/topcat-full.jar
  install -m755 "$srcdir"/topcat "$pkgdir"/usr/bin/topcat
  install -m755 "$srcdir"/tclogo.svg "$pkgdir"/usr/share/pixmaps/topcat.svg
  install -m755 "$srcdir"/topcat.desktop "$pkgdir"/usr/share/applications
}
