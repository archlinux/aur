# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=0.211
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
            '4532c94f60731a6de29b4fe50cb393aaf898fda869ade8f1de18ea5a4907f898'
            '5fdcb7f8ae292c7cd71d5556eed230e1f77d47307b5bbc2eec1cddfa011aa843')

package() {
    for file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${file}" "${pkgdir}/usr/share/fonts/${pkgname}/${file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
