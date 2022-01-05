# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.113
pkgrel=1
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('custom:OFL')

_fontfiles=(
    'LXGWWenKai-Bold.ttf'
    'LXGWWenKai-Light.ttf'
    'LXGWWenKai-Regular.ttf'
    'LXGWWenKaiMono-Bold.ttf'
    'LXGWWenKaiMono-Light.ttf'
    'LXGWWenKaiMono-Regular.ttf'
)

source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE::${url}/raw/v${pkgver}/SIL_Open_Font_License_1.1.txt")
for _file in "${_fontfiles[@]}"; do
    source+=("${pkgname}-${pkgver}-${pkgrel}-${_file}::${url}/releases/download/v${pkgver}/${_file}")
done

sha256sums=('e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602'
            '13a4a029cfa98ff2ed3aa25f3eff5d8a904903f0ba3c5775c8eb8a85e5ca47d4'
            '96f641da36da6a6f55bdc20b8d2ef7c960aab0ea050a4cbfbc9bf294ff17b09b'
            '975b83d03ab110735a8d42dabf260642fdeca981f5b77cca5fb60d8f0289e1ff'
            '6053b6fa683f78244071d3370e022fc180cc214ff2bbe55c0da04b37cd9bb02a'
            '837db795918b2aaead1752e8aeefeec658afd6e9202d9133f1d4b2e3d3d15673'
            'ae4bac1bc297e72ab9676576fa5d0ed689c4863c6e22d17b2e4deaf3fb351e4d')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
