# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=20.6.1
pkgrel=1
pkgdesc='A font derived from a customized version of Iosevka'
arch=('any')
url='https://github.com/aaronmbos/monocode'
license=('OFL-1.1')
source=("${_name}-${pkgver}-bolditalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalbolditalic.ttf"
        "${_name}-${pkgver}-boldupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalboldupright.ttf"
        "${_name}-${pkgver}-lightitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normallightitalic.ttf"
        "${_name}-${pkgver}-lightupright.ttf::${url}/releases/download/v${pkgver}/monocode-normallightupright.ttf"
        "${_name}-${pkgver}-mediumitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalmediumitalic.ttf"
        "${_name}-${pkgver}-mediumupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalmediumupright.ttf"
        "${_name}-${pkgver}-regularitalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalregularitalic.ttf"
        "${_name}-${pkgver}-regularupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalregularupright.ttf"
        "${_name}-${pkgver}-semibolditalic.ttf::${url}/releases/download/v${pkgver}/monocode-normalsemibolditalic.ttf"
        "${_name}-${pkgver}-semiboldupright.ttf::${url}/releases/download/v${pkgver}/monocode-normalsemiboldupright.ttf"
        "${_name}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('c70bc19b2c15d062deec0977d3c9cee271bc2047ff76aa24ab9f17b40d0ed172'
            '94ad1cddfa4702227df7035b8550254b4c452e1218c28d8b5252764dcdf629e8'
            '39559cc8627c1f88e4a8ad391450a5e42fa163a1b280c3562e4f59c5fdde6c34'
            '1348bbe5706f9490af3a717ddca1c83fca2500e33af770bd31a4d4dc86e5f089'
            '1e3ef4a9081c6a4b31a44d92db1f455eebe8b0007112527a9f5caa4969b402ae'
            '15acc7e5684c83daa46de9d4e53b932cb702fc1723e17c815ac761c89144bb0d'
            'b59eb5ce97b96620f45db0ab3df5503a24f54134c8f649266ca8d898e1f552de'
            '5b4166bb0887952389233184946693c2d06681dfdfc110b9fffd34d1544ab87d'
            'd3ba1feb3cfb47c118f64bd077fca16a4d959b516d75cc2b0faebc0f3c8d6837'
            '303c13a178c862ff5538eb69c460edde583165061c277d33cc8f66021cd2487f'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    for file in ${_name}-${pkgver}-*.ttf; do
        install -Dm644 "${file}" "${pkgdir}/usr/share/fonts/TTF/${file/${pkgver}-/}"
    done
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
