# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=2.2.2
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
source=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz"
        "${_pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/errata-ai/vale/v${pkgver}/LICENSE"
        "${_pkgname}-${pkgver}_README.md::https://raw.githubusercontent.com/errata-ai/vale/v${pkgver}/README.md")

sha256sums=('587b5520287f14d27196f017738f438d29fa5f9a556f2b4462d7b1d877a7a0c8'
            'fd994e305c72265851786dba088f3b76c05d2a8b62d6359257c0bd7d0defaa69'
            '4acb9a48c4015282192185d3367a50f6e3de81e7c1c89a42390af3188bfef55d')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}-bin"
}
