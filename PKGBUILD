# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_font="matter"
pkgname="otf-${_font}"
pkgver=1.021
pkgrel=1
pkgdesc="Font for designers, developers and everyone else!"
arch=(any)
url="https://displaay.net/typeface/${_font}-collection/${_font}"
license=(custom)
depends=(fontconfig)
_dl_prefix="https://font.gooova.com/storage/unpacked_archives/14487"
source=("${_font}.zip::https://font.gooova.com/d/14487/${_font}-font.zip")
sha256sums=("af915024e9a8796e4e4431985b791831462d94357aafce5d7be79b52d0031df7")
# source=(
#   "${_font}-light.zip::${_dl_prefix}/Matter-Light.otf"
#   "${_font}-light-italic.zip::${_dl_prefix}/Matter-LightItalic.otf"
#   "${_font}-regular.zip::${_dl_prefix}/Matter-Regular.otf"
#   "${_font}-regular-italic.zip::${_dl_prefix}/Matter-RegularItalic.otf"
#   "${_font}-semibold.zip::${_dl_prefix}/Matter-SemiBold.otf"
#   "${_font}-semibold-italic.zip::${_dl_prefix}/Matter-SemiBoldItalic.otf"
#   "${_font}-bold.zip::${_dl_prefix}/Matter-Bold.otf"
#   "${_font}-bold-italic.zip::${_dl_prefix}/Matter-BoldItalic.otf"
#   "${_font}-medium.zip::${_dl_prefix}/Matter-Medium.otf"
#   "${_font}-medium-italic.zip::${_dl_prefix}/Matter-MediumItalic.otf"
#   "${_font}-heavy.zip::${_dl_prefix}/Matter-Heavy.otf"
#   "${_font}-heavy-italic.zip::${_dl_prefix}/Matter-HeavyItalic.otf"
# )
# sha256sums=(
#   "05689f9aff7a8fad894e80c84c0cd23742e4320f6ba94d181396d3d7110fe8c1"
#   "01220bdc4084c2958f99320273b5a2bf45e074d196c9fc1436076ec1e476395b"
#   "dfcaeafa66e84f148ff0e6f910f0a34b4d25d0c184d05326cfbf0849abc1818c"
#   "93c872b0b2be91d022b5e925ce1f504197afd73ce4f5d2d9c7fee74224b5c299"
#   "ed8fe902e2f780b810f8162b2decafd7b998fa451198aa3d3d04bb682b42bd38"
#   "d02e445963db37b941ce1e384ab29434f2d686ea7b4c4a10e80394b33424159c"
#   "a7c6353d89c8881dfc00652c433f04a66d97297e1bc6e0ef443b2ff2ea01a6b2"
#   "0cd32a89eba560167c791ee83b1ae0df102c6bf2560a64b88cf51d9637183307"
#   "056826caaac1ba904ca1a41242b83ebad37a031d8c85acfde30b0813c65ef63d"
#   "657a4ea8bf655cb0099e96021013f00051a0c8b63724f67c975738eb549a6a9e"
#   "3fa6ac89f190a9b8a243eed4a15913833ae8cc7eab3b2b0b179c13535301c86a"
#   "c12fdc6e1f6d0e8301db083207c35e4f95d6d982be10f2dfadc78bc1f91ee894"
# )

package() {
  local _font _fonts
  mkdir -p "$pkgdir/usr/share/fonts/matter"
  _fonts=$(find "${srcdir}" | grep "\.otf")
  for _font in "${_fonts[@]}"; do
    echo "${_font}"
    install -m644 ${_font} "$pkgdir/usr/share/fonts/matter"
  done
}
