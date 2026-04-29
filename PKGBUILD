# Maintainer: ShortArrow <bamboogeneral@gmail.com>
pkgname=runex-bin
pkgver=0.1.12
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
sha256sums_x86_64=('135b3cf784b457cbd5e9e92c89674f1115905ddfd19cfb56cf8b9b60f1cc9352')
sha256sums_aarch64=('4a801b77069fbfdaa1357135838d5968984006f98c75e952bdf0c0bfc141943f')
sha256sums=('735fa89d57bbf22a8c85d829aa1ed791cce81ffdb900467333025ab7b2feee1c'
            'df4d6c701023dd3150e90bc8f56622bca7cfa4215d4a05797081459330b7ed8e')

package() {
    install -Dm755 "${srcdir}/runex" "${pkgdir}/usr/bin/runex"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
