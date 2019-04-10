#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
pkgver=0.5.2
pkgrel=1
pkgdesc="An open source desktop YouTube player built with privacy in mind."
arch=('x86_64')
url="https://github.com/FreeTubeApp/FreeTube"
license=('GPL')
options=("!strip" "staticlibs")
source=(
    "freetube.desktop"
    "$pkgname-$pkgver-$pkgrel.zip"::"https://github.com/FreeTubeApp/FreeTube/releases/download/v$pkgver-beta/FreeTube-linux-x64.zip"
    )

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir/"{usr/bin,/usr/share/pixmaps,usr/share/applications/,opt}
    cp -R $srcdir/FreeTube-linux-x64 $pkgdir/opt/$pkgname
    ln -s /opt/$pkgname/FreeTube $pkgdir/usr/bin/$pkgname
    install -Dm644 "$srcdir/FreeTube-linux-x64/resources/app/src/icons/iconColor.png" "${pkgdir}/usr/share/pixmaps/freetube.png"
    install -Dm644 "freetube.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}


md5sums=('28055125824ebe9e9a6ad564c776a7fe'
         'c8dbc2e15402c1cc94f3597cef4bdadf')
