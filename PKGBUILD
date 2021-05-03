# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=0.303
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
            'ca8585644d34b50d63acb3c8dc51df4f9c1bd3749ee528db18e840825bce0549'
            '1708dc02ec7a6d974ec82c5919a4142d890a22d33ceac173cce356f0f6c27fff'
            '13b0bc086332b21d41d183dbf3de7afae1f23fa454cc0046de2e5dc868e19cfa')

package() {
    for file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${file}" "${pkgdir}/usr/share/fonts/${pkgname}/${file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
