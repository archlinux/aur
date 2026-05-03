# Maintainer: ShortArrow <bamboogeneral@gmail.com>
pkgname=runex-bin
pkgver=0.1.13
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
sha256sums_x86_64=('21c8cd419b889e92d69fc998b3ff263d1229e5b7301eaaef0c18577bf467a859')
sha256sums_aarch64=('6c8cba5d44517fc4b5a1a9f326517f3a4ab43fd106e8fd259ac456e09b15dc85')
sha256sums=('735fa89d57bbf22a8c85d829aa1ed791cce81ffdb900467333025ab7b2feee1c'
            '39529e825fb0fdf127571829a2516064e7888d5a2c9074e3e7d7133bb06ca872')

package() {
    install -Dm755 "${srcdir}/runex" "${pkgdir}/usr/bin/runex"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
