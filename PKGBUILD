pkgname=jcloisterzone
pkgver=3.3.1
pkgrel=1
pkgdesc="A Java version of the classic Carcassonne board game."
arch=('any')
url="http://jcloisterzone.com/en/"
license=('AGPL')
depends=('java-runtime')
source=("https://github.com/farin/JCloisterZone/releases/download/v${pkgver}/JCloisterZone-${pkgver}.tgz"
        'jcloisterzone.sh'
        'jcloisterzone.desktop'
        'ico.png')
md5sums=('cb13173f918d2f67c983a7491e6ea666'
         '1b1b04d8d0bef074b96033e840affc65'
         '89950434a2f55328dc0f67a8dca38b23'
         '788c367802b42ce77fa8486168e21d1d')

package() {
    install -d "$pkgdir/usr/share"
    cp -r "$srcdir/JCloisterZone" "$pkgdir/usr/share/"
    find $pkgdir -type d -exec chmod 755 {} \;
    find $pkgdir -type f -exec chmod 644 {} \;
    install -D -m755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
    install -D -m755 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -D -m755 "$srcdir/ico.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
