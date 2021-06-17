# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=tachidesk-jui
pkgver=1.0.1
pkgrel=2
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("x86_64")
url="https://github.com/Suwayomi/TachideskJUI"
license=("MPL2")
depends=("jre-openjdk>=15")
provides=("tachidesk-jui")

_jar=TachideskJUI-linux-x64-${pkgver}.jar

source=("${url}/releases/download/v${pkgver}/${_jar}" 
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
sha256sums=('a35e912eb8f56110e16fb1b01286fc4f77455d951947bb8de6008cc16c5b7125'
            '93d187dd19ae4b41cd8b4174dca6ff85aec8a0815bc8dff9dd15e368ebb97f01'
            '7528715b5b8d8360a9fd7dc096b51fd52bf3da671167e224b6cb637437fc4831'
            '87967b6f5952df47ccc42cdb46e736f85ade91e8fc6bcbdf6980aad2bf10606d')

noextract=("${_jar}")

package() {
    install -Dm644 "${srcdir}/${_jar}"                "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "${srcdir}/${pkgname}.desktop"  -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/${pkgname}.png"      -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm755 "${srcdir}/${pkgname}.sh"          "${pkgdir}/usr/bin/${pkgname}"
}
