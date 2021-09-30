# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.100
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
            '1778f25ff2b3bd138a565a4e98c1e957702b989388ebdf7c2343d2ac3606ca47'
            'fae31363dc42a4b381fff413858edcc88e892496e4959cb73814ba1d6801a00c'
            '8446e9aed602d2510b0d3e4f695fd117a7bbd064e8cf578309832c1794adaf82'
            'b17beace8434f91e17a348248df3e63b64f46ba5711af71732a93fc15f2e33a5'
            '4dc97abed304f0807b4a6a73c7285ee5aefcc8c66596394e30cf8b43721dbbce'
            '76b08bda637465b2b5706c751d0813861290c1c3d8b9897f653267b2d2b27125')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
