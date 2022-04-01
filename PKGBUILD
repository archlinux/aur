# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Co-Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>
pkgname=vale-bin
_pkgname=vale
pkgver=2.15.5
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

sha256sums=('6df0e54dec7b114d69e374d68c998d99a174ab8c28ee2506cb3e85ac641a7dc3'
            'a47705b82ea39864e55f418911a5046bbc66533755d4dd9302bb76abe38fadb3'
            '8efbedd9f8fdd0f29285cfca1b53d71cc7607e48ad83e319fff66214f4301632')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}-bin"
}
