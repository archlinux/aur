# Maintainer: Qiumix <j487428862@gmail.com>

pkgname=ttf-smile-nerd
pkgver=1.0.3
pkgrel=1
pkgdesc="Best programming language font with CJK support, which remix FiraCode Mono and LXGW Wenkai Mono"
arch=('any')
url="https://github.com/SOV710/smile-nerd-font"
license=('OFL')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-font")

_reg_file="SmileNerdFontMono-Regular.ttf"
_light_file="SmileNerdFontMono-Light.ttf"

source=("${_reg_file}::${url}/releases/download/v${pkgver}/${_reg_file}"
        "${_light_file}::${url}/releases/download/v${pkgver}/${_light_file}"
        "LICENSE::https://raw.githubusercontent.com/SOV710/smile-nerd-font/refs/heads/main/LICENSE")

sha256sums=('4e8ecf0a080310e5039198c4cc20c1e5797e832ef1e017910e23c4cdf57d3ecd'
            '62964b54e2f1ac020ebf799ab9212274ab02829325fea06561ae3b4ba39fb370'
            'af3cb2ff48b5dffc4d0095116cf4b3b459597d384b6c46604f39c7b71408524e')

package() {
    install -Dm644 "${_reg_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_reg_file}"
    install -Dm644 "${_light_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_light_file}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
