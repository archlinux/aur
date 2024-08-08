# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=stilts
pkgver=3.5.0
_pkgver=3.5
pkgrel=1
pkgdesc="Starlink Tables Infrastructure Library Tool Set"
arch=('any')
url="http://www.star.bris.ac.uk/~mbt/stilts/"
depends=('java-runtime' 'sh')
license=('GPL')
noextract=('stilts.jar')
source=("stilts-${pkgver}.jar::https://www.star.bristol.ac.uk/mbt/releases/stilts/v${_pkgver}/stilts.jar"
        "stilts" "stilts4.gif")
md5sums=('a52d4ab81546f353300b237f86c16db6'
         '4f7dd76969e791b934cfd8eb59822bf2'
         '574cb973184b3b7562f84c3e171244dd')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -m644 "$srcdir"/stilts-${pkgver}.jar "$pkgdir"/usr/share/java/stilts.jar
  install -m755 "$srcdir"/stilts "$pkgdir"/usr/bin/stilts
  install -m755 "$srcdir"/stilts4.gif "$pkgdir"/usr/share/pixmaps
}
