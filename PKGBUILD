# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.006
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
            '4f92cf0445dd1683dc56934bed3cfe322ae803d0c7e9c76b7049d774abb58abb'
            '98146eeef4b129397271d12fcf923097e560fd8c30759b80f612ffa2cbfadd41'
            '04fd673a4c38eca98a81c467c318db3e07a5926fe4207b1b8c8695ca6cb86822'
            'd4e93f6e1e1ed49105d346f4e01839d3f70a3b3bc1074171f92d1f89888173fb'
            '46cd3e47e8c31adf90ee835c94dbd42ee36b500b963f7a534750147fe0087b8f'
            '4b94e527c9a48034d9fd1ccb2c76cd8b658ce9d41e4fac5fe409b21e14f13d11')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
