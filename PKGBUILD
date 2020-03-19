# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=2.1.0
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz"
        "${_pkgname}_${pkgver}_LICENSE::https://raw.githubusercontent.com/errata-ai/vale/v${pkgver}/LICENSE"
        "${_pkgname}_${pkgver}_README.md::https://raw.githubusercontent.com/errata-ai/vale/v${pkgver}/README.md")

sha256sums=('0ed5d5a2261dee94a92b598b0d4ed910e48fef1bd0d2968ada6ae8fc5f04b2bc'
            '94a482dbb63133ac0ee01fc7b4d1618ebc2003baf400baff98e35dc21969653e'
            '4acb9a48c4015282192185d3367a50f6e3de81e7c1c89a42390af3188bfef55d')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
