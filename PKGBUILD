# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_fontname=spleen

pkgname=spleen-font
pkgver=1.7.0
pkgrel=1
pkgdesc="Monospaced bitmap fonts"
arch=('any')
license=('BSD')
url="https://www.cambus.net/spleen-monospaced-bitmap-fonts/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
conflicts=('bdf-spleen')
source=(
  "https://github.com/fcambus/spleen/releases/download/${pkgver}/spleen-${pkgver}.tar.gz"
)
sha256sums=(
  '2a8768d5cd2f4be327ee66bd80f343edd9e31af7836c4a177dd85caac9289cd8'
)

package() {
  cd "${srcdir}/${_fontname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/fonts/${_fontname}"
  for font_file in spleen-*.*; do install -Dm644 "${font_file}" \
    "${pkgdir}/usr/share/fonts/${_fontname}/${font_file}"; done
  install -Dm644 fonts.alias "${pkgdir}/usr/share/fonts/${_fontname}/fonts.alias"

  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
