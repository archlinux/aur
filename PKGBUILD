# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_fontname=lxgw-new-clear-gothic

pkgname="${_fontname}-fonts"
pkgver=0.235
pkgrel=1
pkgdesc='A Simplified Chinese sans-serif font derived from IPAex Gothic'
arch=('any')
url='https://github.com/lxgw/LxgwNewClearGothic'
license=('custom:IPA_Font_License')

_fontfiles=(
  'LXGWFasmartGothic.ttf'
  'LXGWNewClearGothic-Book.ttf'
  'LXGWNewClearGothic-Regular.ttf'
)

source=("${pkgname}-${pkgver}-LICENSE.txt::${url}/raw/v${pkgver}/LICENSE.txt")
for _file in "${_fontfiles[@]}"; do
  source+=("${pkgname}-${pkgver}-${_file}::${url}/releases/download/v${pkgver}/${_file}")
done

sha256sums=(
  '1ed8b0e4c4a640816241d0a1cedcd2652b2f42cc155527256e8e54b6266c915f'
  'f2cdf6caf1c305f4048f5cf5bc56f251288408b4a31b6dfa0cc7db5e10e1db92'
  '6128153f595f18cf15f97b99b008d60c957712ac6fdbff6e91e64d7845741963'
  'b25db58ca4cfbcd8774a84563e9728e4481075ca22ad139d9fbfed68c64e82a8'
)

package() {
  for _file in "${_fontfiles[@]}"; do
    install -Dm644 "${pkgname}-${pkgver}-${_file}" "${pkgdir}/usr/share/fonts/${_fontname}/${_file}"
  done
  install -Dm644 "${pkgname}-${pkgver}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
