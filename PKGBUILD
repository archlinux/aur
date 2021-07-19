# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.004
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
            'fdf0cf456185001813fe267fc6fdf1522a8bffc0fb23c72faa0b587a45411cb4'
            'aa0d7f696ac31c4b6fcfd5e185183135f0465f469c5d408636ff47f8a8d13fdf'
            '2889b7414f3fed67b5fe71f0c5f1312fe7cc09cfd246590b98ecef8d26309f31'
            '02b4120505ab1ec3765234ed13a32f7c87573eaa7ecd4e89679243425363efed'
            '154239a845ae0fe48b5bf215c93390f1bbfb93ab6af41d5dab0ae632c987d58f'
            '73f8e959ed2395f69d935ed4b0e10c4fcac8f31a0662a52f102cb051ecddf4b5')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
