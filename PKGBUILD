# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.111
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
            '5b57609f69d44b408ef503d2470f9ce57c28f58fd045cf6e4eb7c90e44a53f95'
            'a2696b8186916040f221226f4a50a27807ed956d54193ad019bd33cea5966081'
            'd39e5812d0449d49b2c848eb726af22d4d82957dd13938b2f35526bd13a061c8'
            '1bbd2e0ef121b36e8270c3aaa984f683090311e89ecbd4e25d7aa672c48e384b'
            '417a9e3dd12fb4d963c6f49b7b96cae0f3aa27318b59aeed3688d648acecacb4'
            'b5e332f4d92ad445be802d078bd35bf1c988b4c13149fd5ffc1a2190d45efb8b')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
