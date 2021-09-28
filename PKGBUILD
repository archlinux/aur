# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.008
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
    'LXGWWenKaiUI-Regular.ttf'
)

source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE::${url}/raw/v${pkgver}/SIL_Open_Font_License_1.1.txt")
for _file in "${_fontfiles[@]}"; do
    source+=("${pkgname}-${pkgver}-${pkgrel}-${_file}::${url}/releases/download/v${pkgver}/${_file}")
done

sha256sums=('e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602'
            '9bb3791a1fbc2cc0687eb75340548e26add4c4d204a0da6e6ecc30d081994612'
            '3668725965eec4a3045cb4c1e80b3c17afd53abb96271464ab2ffd4a29cd8595'
            '25115b2395112df2af1849051e429a0e339a672be90f25d20e19b00ab5e8dfc4'
            '33526cba92ee4a409ce0e2710fd7530225266f233750e78c64272c31b80558a6'
            'f6f71a8e784a01dc891a01d2420b57ce29c96d45869ef4edb25bf11a94ae4d24'
            '141fc1c8f1f41000a3d71133f0de86d597903f7ec139543be586106f01922f21'
            'fe24045d51bf98dfa6c522c9ac50b172c10a7d0c2486411d43c2444152dd0e15')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
