# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=cacheprinter
pkgver=0.4.2e_201227_0850
pkgrel=1
pkgdesc="utility to download, print or export geocaching.com listings"
arch=('any')
url="http://cacheprinter.bubbles.sk/"
depends=('java-runtime')
license=('custom:freeware')
source=("http://cacheprinter.bubbles.sk/cacheprinter.jar" "cacheprinter.desktop")
md5sums=('d48d9dc584180ed39d3c110ccc208a0f'
         'ca12990219ec87de909a802fab568682')

build() {
true
}

package() {
cd $srcdir
install -D -m644 ./${pkgname}.jar $pkgdir/usr/share/java/${pkgname}/${pkgname}.jar
echo -e "#"'!'"/bin/bash\njava -jar /usr/share/java/${pkgname}/${pkgname}.jar" >./${pkgname}
install -D -m755 ./${pkgname} $pkgdir/usr/bin/${pkgname}
install -D -m644 $srcdir/images/icons/cplogo.png $pkgdir/usr/share/pixmaps/cacheprinter.png
install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
