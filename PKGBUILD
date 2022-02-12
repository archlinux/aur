# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.120
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
            'c156dce4e0794b4874f0fa8bb58e14181841aff703e5c6e048174467315e41ec'
            '6809c13178e070b9279fa564942e6389875cf203534a1355f9170ad29f584566'
            '0f862ef6379b0afa0d68198fbd5a9c60ed88684ba9aba4b83661cff1de851b52'
            '901af0aaa288e615c84aa9ff7f1bb6f0985d8f5e9845222cdcaba79054a411da'
            '16d7cc8711fb5ca6245eb373b41d3096c193cace8c67e52e9ed1d6d2076e3e6f'
            '7b987f7c82b012827aacab4f5364c776d80e39784ecc8a15ac63601c2f4c63a9')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
