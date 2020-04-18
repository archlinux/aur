# Maintainer: Schwan Carl <schwancarl at protonmail dot com>

pkgname=pseuco-ide
pkgver=v2.0.3
pkgrel=1
pkgdesc="An IDE for the pseuCo programming language written in Kotlin.
Uses the pseuco-java-compiler internally."
arch=('any')
url="https://dgit.cs.uni-saarland.de/pseuco/pseuco-ide/"
depends=('java-environment') 
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://dgit.cs.uni-saarland.de/pseuco/pseuco-ide/-/jobs/artifacts/master/download?job=jar"
    "pseuco-ide.desktop"
    "pseuco-ide"
    ".install")
sha256sums=('fc0facee4fd2bca60649289f3f5e6900a825f0f8708b19a2a349c705bd5eaf05'
            '87186ce1e69f6737c02929ec3fa5898d795a567200b6fa5ff3eee40a55a78df7'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm0755 ${pkgname}*.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -m755 "${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
}
