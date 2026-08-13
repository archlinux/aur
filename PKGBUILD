# Maintainer:
# Contributor: Danie <danisdgk@gmail.com>

pkgname=ttf-monocode
_name="${pkgname#ttf-}"
pkgver=20.8.0
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
sha256sums=('47aff4589213fa293e637b9aa79bc746b06fd6d1e6a630690505890038055494'
            '7233cc1055a41e784bc286f03cac8656ee878660302f86e98f90c09d071ceb54'
            'c1d3a22ae180e30007fed67098264754742c9885ce90dc07cafb685e8fe1c725'
            'f7b767aac1a080219340ef09e5733f4fcb5581927f29be14e53b034ab269c1ce'
            'db24c73e5d88752b528640d7312030921f393f6d25095a5f4ff27df273612da1'
            '5dfc61cb907ff616dc66c22d313055cff174fae33127c971929cb48cc6aad967'
            '453eccd8369a443297472782084c3c3a7746a84dbaa508c6cdd2034c07d4f6e8'
            'd06915c1f00dbf9a17571d2a3ff46a2122ae2ce746d3cfbf7622f742f4a81500'
            '8ce48723fd5f51adee2dd70721bc9e6fbf8b2646668d7b2fa1458a93d06d8df1'
            'b990df86cacf80ece60880ffc657d2228648ee469bff30dc4233dff13b4be2aa'
            '3f41ef3c8872aea4774d66d4af65d84c2ae482fa93eb05986e7eb3a4bbef46e6')

package() {
    for file in ${_name}-${pkgver}*.ttf; do
        install -Dm644 "${file}" "${pkgdir}/usr/share/fonts/TTF/${file/${pkgver}-/}"
    done
    install -Dm644 "${_name}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
