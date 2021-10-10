# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai
pkgver=1.101
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
            'f6ee736bdc65c0edcec39be60c7612468eb0049b3457eaf601f4e3f75561dc7d'
            '7a0f547779ac2285023313fcee156655bd47d174f09063e6f3ecb2750edb1768'
            '2b478f7cc1e997cda8c72c6413a25a7b800f7368de1933f10d9b69c56807aca6'
            '73088d2ec2f0e517158538120e05ddc92cbad4aa50852dc9eaeda1e2b39cf319'
            'fa2128c01b74b231eeca019f18c4b5598ce99f400b8198ddf06d0cf8839407ca'
            '6d0a1c3b7030b20120baa7d0ef7a0470578bb2ae52fff556fc57062970255d60')

package() {
    for _file in "${_fontfiles[@]}"; do
        install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
    done
    install -Dm644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
