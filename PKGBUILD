# Maintainer: Paolo Viotti <skypixel@gmail.com>

pkgname=edumips64
pkgver=1.2.9
pkgrel=1
pkgdesc="Cross-platform educational MIPS64 CPU simulator"
arch=('any')
url="https://www.edumips.org"
license=('GPL')
depends=('java-runtime')
source=(https://github.com/EduMIPS64/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.jar
        $pkgname.desktop
        $pkgname.png
        $pkgname)
sha256sums=('422ff853ba7a7dd31dc0eb3153c5bda2fe9de433408e37b17cf69c833ce02246'
            '95ac7ee775fc01c9868fcba81b89c11bd104531c4d48316721e8a2ff9ef29922'
            '25d07c621bd61d1153e1ebf21a2d111a46ec1d74f8c8887ddade423cadbd47d4'
            'e0ba9997d2fa5239b4e114c1b23fa091063927387d76c641bc1eebc26955b24a')

package() {
    cd "${srcdir}"
    install -Dm644 "${srcdir}/$pkgname-$pkgver.jar" "${pkgdir}/usr/share/$pkgname/$pkgname.jar"
    install -Dm755 "${srcdir}/$pkgname" "${pkgdir}/usr/bin/$pkgname"

    # icon and .desktop file
    install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
    install -Dm644 "${srcdir}/$pkgname.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
}
