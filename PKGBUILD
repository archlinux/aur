# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=20.8.1
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
sha256sums=('d8c7b1d5ec17f3fb3c613ac1ef8f7654ac67aa9811bc9c8355cfc7dec2c6735a'
            '43436d7f2f0753563d756c7c7e19d07c3547613753cfab7e84a0558ef8f8f6b2'
            '3b549f28614044d2fe48791c268b17b79f801c9dc633404fd8df900e6c195592'
            '2e6386f4fcecf2ba6f97af3a03eb2417dc494998d52f091b9e80456c8f1cabd1'
            '5ac34f847b815cddeb604c8adaaf9b64e24155667a939a6c0a70b59e7e0da437'
            'b6975e0fe3d33fbdeb433b778731bdadbf4ab19629aa4e200cf699aedcb1cde5'
            '5f939d99816979d339d967c362668edb60dab1881d4af3522b4822e242c21a9f'
            'e24462fea8a53f0853861b146c9610d8809ba98f0f51e306b7e70bcf52fb9a99'
            '6c1489e7f2dd89e50c0d7c58fbb151b6d0c2bf0700c1b84cbb8e8bae4cbd1962'
            'c7dd5006d16c862839c789f254fa9d94b42971265628c259f455d1b470ff4446'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    for file in ${_name}-${pkgver}*.ttf; do
        install -Dm644 "${file}" "${pkgdir}/usr/share/fonts/TTF/${file/${pkgver}-/}"
    done
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
