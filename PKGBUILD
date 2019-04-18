#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="An open source desktop YouTube player built with privacy in mind."
arch=('x86_64')
url="https://github.com/FreeTubeApp/FreeTube"
license=('GPL')
options=("!strip" "staticlibs")
source=(
    "freetube-bin.desktop"
    "$pkgname-$pkgver-$pkgrel.zip"::"https://github.com/FreeTubeApp/FreeTube/releases/download/v$pkgver-beta/FreeTube-linux-x64.zip"
    )

package() {
    install -d "$pkgdir/"{usr/bin,/usr/share/pixmaps,usr/share/applications,opt}
    cp -R $srcdir/FreeTube-linux-x64 $pkgdir/opt/$pkgname
    ln -s /opt/$pkgname/FreeTube $pkgdir/usr/bin/$pkgname
    install -Dm644 "$srcdir/FreeTube-linux-x64/resources/app/src/icons/iconColor.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "freetube-bin.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}


md5sums=('e6ae90f67b51efc28cbc249aefc7fc28'
         '1bfca76b8e4c3e0bad8eb02cdf9ecd71')
