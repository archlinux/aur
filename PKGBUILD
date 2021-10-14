# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.110
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
            '4cd6302e55d76ca9d00629c7f9451a45c6475c1f24397e070aa7b9ee8c94e5b9'
            '3b54ecbc047a2ec412282d4440c579124406642ee98e510492afbfb5de158180'
            '6e07b27ce4a9f4c45828df23c0e95f56fa325194493a92152041b4721a690354'
            '9c9ea301f4e153517568e06ee4ced53e3584f2885c0bfaa80fbc70826fba13c7'
            '59f4ea6c73dd8ee5ced3ba711b594fd3e5fd8633ea6bd15197b427ee9e715366'
            '081f4c70bca033ff661bb13b36cec7df491bae2ec5abbcc352dd2057cfac2a96')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
