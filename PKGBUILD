# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=gstatz
pkgver=1.3
pkgrel=3
pkgdesc="utility for tracking cycles of menstruation and for prediction of next period's date"
arch=('i686')
url="http://sourceforge.net/projects/gstatz/"
license=("GPL-3")
depends=('java-runtime')
source=("http://downloads.sourceforge.net/gstatz/GStatz-${pkgver}.tar.gz" "gstatz.desktop")
md5sums=('3048e374fab008da862f67b941302642'
         '5519455d2ae558c537980bb987cf1138')

build() {
true
}

package() {
cd $srcdir/GStatz-${pkgver}
rm ./start.bat ./start.sh
echo -e "#"'!'"/bin/bash\njava -Xmx128M -jar /usr/share/GStatz-${pkgver}/GStatz.jar" >./gstatz
mkdir -p $pkgdir/usr/share/GStatz-${pkgver} $pkgdir/usr/bin $pkgdir/usr/share/GStatz-${pkgver}/lib
install -D -m644 lib/* $pkgdir/usr/share/GStatz-${pkgver}/lib
install -D -m644 * $pkgdir/usr/share/GStatz-${pkgver} || true
install -D -m755 ./gstatz $pkgdir/usr/bin
install -D -m644 $srcdir/gstatz.desktop $pkgdir/usr/share/applications/gstatz.desktop
}
