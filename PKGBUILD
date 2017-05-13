# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=jcloisterzone
pkgver=3.4.3
pkgrel=1
pkgdesc="A Java version of the Carcassonne board game."
arch=('any')
url="http://jcloisterzone.com/en/"
license=('AGPL')
depends=('java-runtime')
source=("http://jcloisterzone.com/builds/JCloisterZone-${pkgver}.tgz"
        'jcloisterzone.sh'
        'jcloisterzone.desktop'
        'ico.png')
sha256sums=('9cc30a203e76239f9ef236cd1714b548b79faeb0e12cd8a0db0b6836baa6dd98'
            '8487b2b043da8604deb48ce702c9bf8bfbcacf8568d71b17702df9b8eb98a3d6'
            '7b25dfcdcb9ec286555a5f03e7b16bbc9c71f117f10aefc79b7e4537a72f4253'
            '012a090df7f1fa30fe3ede444eab92cb2f6fd3c37e1b6786f04da9feb3f7cf38')

package() {
    install -d "$pkgdir/usr/share"
    cp -r "$srcdir/JCloisterZone" "$pkgdir/usr/share/"
    find $pkgdir -type d -exec chmod 755 {} \;
    find $pkgdir -type f -exec chmod 644 {} \;
    install -D -m755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
    install -D -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "$srcdir/ico.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}

# vim:set ts=2 sw=2 et:
