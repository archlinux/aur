# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Co-Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>
pkgname=vale-bin
_pkgname=vale
pkgver=2.20.1
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
provides=('vale')
conflicts=('vale')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
source=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz"
        "${_pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/errata-ai/${_pkgname}/v${pkgver}/LICENSE"
        "${_pkgname}-${pkgver}_README.md::https://raw.githubusercontent.com/errata-ai/${_pkgname}/v${pkgver}/README.md")

sha256sums=('1d8a6d75482b0b16e9948c250573244408d5dc2730d49ea87949cdb579cdd1fc'
            'a47705b82ea39864e55f418911a5046bbc66533755d4dd9302bb76abe38fadb3'
            '1c591ccca3abbfc228f7afa88f5f59fb7ab6d617532994275aa78e8057168852')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}-bin"
}
