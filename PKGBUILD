# Maintainer: Konstantin Gizdov < arch at kge dot pw >
# Co-Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>
pkgname=vale-bin
_pkgname=vale
pkgver=2.26.0
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

sha256sums=('956577b214ce3db8fb11483f99a183cf65673e3bd47423c6d4ebe37f085cadc7'
            '29a16197c8d01cafcacbd9c1774b66b28d7c0f15a6aceed88e4e8068ea398470'
            '73bd287e5dfbdb4879887850b8854536fcf8da724b4e727ba06e0da7045643ee')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}-bin"
}
