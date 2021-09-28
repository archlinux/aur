# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at pm dot me>

pkgname=tachidesk
pkgver=0.5.3_r966
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Tachidesk-Server"
license=("MPL2")
depends=("java-runtime>=8")
provides=("tachidesk" "tachidesk-server")
conflicts=("tachidesk-preview")
_semver="v${pkgver%_*}"
_commit="${pkgver#*_}"
_jar=Tachidesk-Server-${_semver}-${_commit}.jar

source=("${url}/releases/download/${_semver}/${_jar}"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
sha256sums=('30d984c294d61c029bcd6717dc50761833744225f17e08c3e012b5e592c8e079'
            '22a6a9a8c8198985759f66b35377d87bce82d46dbf7a4a7505b55621a9c5487e'
            '7528715b5b8d8360a9fd7dc096b51fd52bf3da671167e224b6cb637437fc4831'
            '3ac5c813b88f2dd4f38fac5dcd344f1f54dd9929fbb8faba758a972015d12c19')

noextract=("${_jar}")

package() {
    install -Dm644 "${srcdir}/${_jar}"                "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "${srcdir}/${pkgname}.desktop"  -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/${pkgname}.png"      -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm755 "${srcdir}/${pkgname}.sh"          "${pkgdir}/usr/bin/${pkgname}"
}
