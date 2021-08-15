# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=tachidesk-jui
pkgver=1.1.2
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("x86_64")
url="https://github.com/Suwayomi/Tachidesk-JUI"
license=("MPL2")
depends=("jre-openjdk>=15")
provides=("tachidesk-jui")

_jar=Tachidesk-JUI-linux-x64-${pkgver}.jar

source=("${url}/releases/download/v${pkgver}/${_jar}" 
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
sha256sums=('SKIP'
            'ce97f5451bc5cc13a17c7fbc4302ff5c7d5761f7981dc85abca5005add76a84b'
            '7528715b5b8d8360a9fd7dc096b51fd52bf3da671167e224b6cb637437fc4831'
            '2cb80b6ddf85b7697626b77d4bec0946734dc7a8306934fd58e993a5f3eeeb2c')

noextract=("${_jar}")

package() {
    install -Dm644 "${srcdir}/${_jar}"                "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "${srcdir}/${pkgname}.desktop"  -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/${pkgname}.png"      -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm755 "${srcdir}/${pkgname}.sh"          "${pkgdir}/usr/bin/${pkgname}"
}
