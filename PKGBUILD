# Maintainer: Konstantin Gizdov < arch at kge dot pw >
pkgname=vale-bin
_pkgname=vale
pkgver=2.6.8
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

sha256sums=('c945b69ddb8288075f402b68d1b2d9d348315ad9c11cf03e2f49ec70977c2cd3'
            'fd994e305c72265851786dba088f3b76c05d2a8b62d6359257c0bd7d0defaa69'
            'e4c8647bdfdcb20c1d39df4101efcc90d145e84b735bac64929a6d85494852a7')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}-bin"
}
