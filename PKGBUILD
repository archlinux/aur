# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=jcloisterzone
pkgver=4.0.2
pkgrel=1
pkgdesc="A Java version of the Carcassonne board game."
arch=('any')
url="http://jcloisterzone.com/en/"
license=('AGPL')
depends=('java-runtime>=8')
source=("http://jcloisterzone.com/builds/JCloisterZone-${pkgver}.tgz"
        'jcloisterzone.sh'
        'jcloisterzone.desktop'
        'ico.png')
sha256sums=('449f4497dd9ef8b5fa4d633045de2dc2213900da5c78a9ef3b6c81d540ef0950'
            'b9ccc952f405b9905130f1903cb3eb8d85a738470a98c414ad319e44f8374c83'
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
