# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_fontname=spleen

pkgname=bdf-spleen
pkgver=1.0.0
pkgrel=1
pkgdesc="Monospaced bitmap fonts"
arch=('any')
license=('custom' 'GPL2')
url="https://www.cambus.net/spleen-monospaced-bitmap-fonts/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("https://github.com/fcambus/spleen/releases/download/${pkgver}/spleen-${pkgver}.tar.gz")
sha256sums=('b4bf78e646f8b9c85f0ee870e6472506ccf5e144548e3f209ebb57faf90d6fa0')

package() {
  cd "${srcdir}/${_fontname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/fonts/${_fontname}"
  for bdf_file in spleen-*.bdf; do install -Dm644 "${bdf_file}" \
    "${pkgdir}/usr/share/fonts/${_fontname}/${bdf_file}"; done
  install -Dm644 fonts.alias-spleen "${pkgdir}/usr/share/fonts/${_fontname}/fonts.alias"

  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
