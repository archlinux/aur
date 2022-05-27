# Maintainer: Gleb Buzin < qufiwefefwoyn at gmail dot com >
pkgname=vale2
_pkgname=vale
pkgver=2.17.0
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
provides=('vale')
conflicts=('vale' 'vale-bin')
arch=('x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
source=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_64-bit.tar.gz"
        "${_pkgname}-${pkgver}_LICENSE::https://raw.githubusercontent.com/errata-ai/${_pkgname}/v${pkgver}/LICENSE"
        "${_pkgname}-${pkgver}_README.md::https://raw.githubusercontent.com/errata-ai/${_pkgname}/v${pkgver}/README.md")

sha256sums=('d4f107141594debe06c9e5a5f385f9ed11f7b213536a6b69028a5914697d0ce6'
            'a47705b82ea39864e55f418911a5046bbc66533755d4dd9302bb76abe38fadb3'
            '427b465fd2d85dbd5adf398c395b063cd40ae833ab73e4754afaf96113b1d095')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}_README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    ln -s "/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${_pkgname}-bin"
}

