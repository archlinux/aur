# Maintainer: Schwan Carl <schwancarl at protonmail dot com>

pkgname=pseuco-ide
pkgver=v2.0.0
pkgrel=1
pkgdesc="An IDE for the pseuCo programming language written in Kotlin.
Uses the pseuco-java-compiler internally."
arch=('any')
url="https://dgit.cs.uni-saarland.de/pseuco/pseuco-ide/"
depends=('jdk') 
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=("https://dgit.cs.uni-saarland.de/pseuco/pseuco-ide/-/jobs/artifacts/master/download?job=jar"
    "pseuco-ide.desktop"
    ".install")
sha256sums=('SKIP'
 '87186ce1e69f6737c02929ec3fa5898d795a567200b6fa5ff3eee40a55a78df7'
 'SKIP')

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/applications/"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm0755 "${pkgname}-2.0.0-alpha.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}
