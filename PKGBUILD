# Maintainer: Hugo Sales <first_name at fc.up.pt>
# Maintainer: Schwan Carl <schwancarl at protonmail dot com>

pkgname=pseuco-ide
pkgver=v2.0.4
pkgrel=1
pkgdesc="An IDE for the pseuCo programming language written in Kotlin.
Uses the pseuco-java-compiler internally."
license=('AGPL3')
arch=('any')
url="https://dgit.cs.uni-saarland.de/pseuco/pseuco-ide/"
depends=('java-environment') 
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://dgit.cs.uni-saarland.de/pseuco/pseuco-ide/-/jobs/artifacts/${pkgver}/download?job=release"
    "pseuco-ide.desktop"
    "pseuco-ide"
    ".install")
sha256sums=('3fbe468b0fb3e14cf3d090b212b219669b9dcb5777407668b5e9903b59387403'
            '87186ce1e69f6737c02929ec3fa5898d795a567200b6fa5ff3eee40a55a78df7'
            '4da8ba99c756c3224358ad978d6ce400a16abb3515a8b7c60556e45e2be2833e'
            '0f536557fe11a7506130a58ea675e969a7a6311d7c83fe70818c1028252e6aae')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm0755 ${pkgname}-${pkgver}.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -m755 "${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
}
