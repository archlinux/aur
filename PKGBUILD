# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=0.202
pkgrel=1
pkgdesc="An open-source Chinese font derived from Fontworks' Klee One."
arch=('any')
url='https://github.com/lxgw/LxgwWenKai'
license=('OFL')

_fontfiles=(
    'LXGWWenKai-Regular.ttf'
    'LXGWWenKai-Medium.ttf'
)

source=("${pkgname}-${pkgver}-${pkgrel}-LICENSE::${url}/raw/v${pkgver}/SIL_Open_Font_License_1.1.txt")
for file in "${_fontfiles[@]}"; do
    source+=("${pkgname}-${pkgver}-${pkgrel}-${file}::${url}/releases/download/v${pkgver}/${file}")
done

sha256sums=('e564f06d018e7b95bc3594c96a17f1d41865af4038c375e7aa974dd69df38602'
    'f143bb89e0b7ec03cdeeaae912cb7f5ad6c3aaab2f854e69fd4a3d7b920d084f'
    'c41a399f0d76438586b6ac607a9e5242c62dea62e3a600b71969232918a90b99')

package() {
    for file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${file}" "${pkgdir}/usr/share/fonts/${pkgname}/${file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
