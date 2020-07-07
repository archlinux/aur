# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: skydrome <skydrome@i2pmail.org>

pkgname=durian
pkgver=0.6.0
pkgrel=2
pkgdesc="An open source fan-made tool for easier search of Path of Exile items."
url="https://github.com/thirdy/durian/"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'java-openjfx')
source=("https://github.com/thirdy/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip"
        "icon-128x128.png"
        "durian.sh")
sha256sums=('9f2d4dacf212f5be02e33f19c08cea15de159ec9e8717978e1107db939a84aff'
            '8535d56a223568ca05e5a84361d36e4269f9b7c176e93c8b5f6c0a0c4993be5c'
            '45ec0230d18832190bc1addcecaf9e4fd932b4bd60a7e28efce6ad298542866c')
package() {
    cd "$srcdir"
    install -dm755 "${pkgdir}/usr/share/java/"

    cp -r durian-${pkgver} "${pkgdir}/usr/share/java/durian"
    chmod -R 777           "${pkgdir}/usr/share/java/durian"
    install -Dm755 ${pkgname}.sh    "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 icon-128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
}
