# Maintainer: ShortArrow <bamboogeneral@gmail.com>
pkgname=runex-bin
pkgver=0.1.20
pkgrel=1
pkgdesc="Cross-shell abbreviation engine that expands short tokens into full commands"
arch=('x86_64' 'aarch64')
url="https://github.com/ShortArrow/runex"
license=('MIT' 'Apache-2.0')
provides=('runex')
conflicts=('runex')
source_x86_64=("runex-${pkgver}-x86_64.tar.gz::https://github.com/ShortArrow/runex/releases/download/v${pkgver}/runex-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("runex-${pkgver}-aarch64.tar.gz::https://github.com/ShortArrow/runex/releases/download/v${pkgver}/runex-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/ShortArrow/runex/v${pkgver}/LICENSE"
        "README-${pkgver}.md::https://raw.githubusercontent.com/ShortArrow/runex/v${pkgver}/README.md")
sha256sums_x86_64=('de38b53b7747d926837cc1a4cf99fe9fbd85146e1b3a8e80f6010984393e677d')
sha256sums_aarch64=('985b888414f28dc82612c91a218542536f17e36bd8930d924e467a87aa41a611')
sha256sums=('735fa89d57bbf22a8c85d829aa1ed791cce81ffdb900467333025ab7b2feee1c'
            '28e13c865668cb720d3268d22308687540a69ed44cb0e733c4dd8c4ca896f6f8')

package() {
    install -Dm755 "${srcdir}/runex" "${pkgdir}/usr/bin/runex"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
