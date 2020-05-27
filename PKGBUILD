# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_version=2.22
_version_pkg_updates=0
_gitcommit=914ac905494891fb6aefff78b9d91f5362da67e6

pkgname=kose-font
pkgver="${_version}+${_version_pkg_updates}+${_gitcommit::7}"
pkgrel=1
pkgdesc="A Chinese Font derived from SetoFont / Naikai Font"
arch=('any')
license=('custom:SIL')
url="https://github.com/lxgw/kose-font"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(
  "git+${url}.git#commit=${_gitcommit}"
)
sha256sums=(
  'SKIP'
)

package() {
  cd "${srcdir}/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/fonts/${pkgname}"
  install -Dm644 TTF/KoseFont-SC.ttf "${pkgdir}/usr/share/fonts/${pkgname}/KoseFont-SC.ttf"
  install -Dm644 TTF/KoseFontP-SC.ttf "${pkgdir}/usr/share/fonts/${pkgname}/KoseFontP-SC.ttf"
  install -Dm644 TTF\ JP/KoseFont-JP.ttf "${pkgdir}/usr/share/fonts/${pkgname}/KoseFont-JP.ttf"
  install -Dm644 TTF\ JP/KoseFontP-JP.ttf "${pkgdir}/usr/share/fonts/${pkgname}/KoseFontP-JP.ttf"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 OpenType_Features.md "${pkgdir}/usr/share/doc/${pkgname}/OpenType_Features.md"
  install -Dm644 history.md "${pkgdir}/usr/share/doc/${pkgname}/history.md"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname}/SIL_Open_Font_License_1.1.txt"
}
