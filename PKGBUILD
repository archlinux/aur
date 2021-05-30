# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=0.329
pkgrel=1
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
for file in "${_fontfiles[@]}"; do
    source+=("${pkgname}-${pkgver}-${pkgrel}-${file}::${url}/releases/download/v${pkgver}/${file}")
done

sha256sums=('e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602'
            'f048d7f8aa278f5db6644ac7ab5b1ab0194f63027741dc08a84fc97f25b7229a'
            'ae732c95a4ab18ae0fd0c80fc37d4bbf4b63f3894f2fb2e4c57d56eee7ea58c6'
            '50d27a8b102e641728114edad94f3b7686f769e7f3366007f5b99792c8c34cc5')

package() {
    for file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${file}" "${pkgdir}/usr/share/fonts/${pkgname}/${file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
