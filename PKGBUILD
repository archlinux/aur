# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.005
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
            'c51fbce1a83ccaccc417e0e8a4e5115c777a09b932fc815881cd1ba0857912d4'
            '9eca19304734aefd612d16630e3fa5df62fb83c0aa370bddc62e698bc7c2a142'
            'e1dc371390f99fd0fce36651e6b682e2dbd8bbd90c6d89a5990e4d01cffd1805'
            '0fb6d7835f9d61f35ad0aa5cfe2697d4474a8181db94848fe7290898ddd5fccd'
            'b5af5b9c161209f979cfb86b769a082b538f065f39d7cf5fc7e9b30348ac2cb5'
            '73c24eea54a9007920831f440aebf8e2841a2eb684e288a3b90b418fce822cd1')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
