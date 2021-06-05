# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=0.333
pkgrel=2
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('custom:OFL')

_fontfiles=(
    'LXGWWenKai-Bold.ttf'
    'LXGWWenKai-Light.ttf'
    'LXGWWenKai-Regular.ttf'
)

source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE::${url}/raw/v${pkgver}/SIL_Open_Font_License_1.1.txt")
for _file in "${_fontfiles[@]}"; do
    source+=("${pkgname}-${pkgver}-${pkgrel}-${_file}::${url}/releases/download/v${pkgver}/${_file}")
done

sha256sums=('e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602'
            '8263cba7f3709104477324510b89f5db5ff649516e2a254708db21833f9fe383'
            '8b3f91fe53fc8e1df2181b52df73eed824206e0b9bf7f573680ec9062570a3a5'
            '1c39892367a01ff83fa639a4561c672c64047f68dec7a734d1e1cf80ee756a0c')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
