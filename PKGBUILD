# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="kaushan-script"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.02
pkgrel=1
pkgdesc="Feels like writing quickly with an inked brush, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/kaushan/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/releases/${_font}-v.${pkgver}.zip")
md5sums=('56c4d12b0afa2064249f258f2d8f6171')

package() {
  cd ${srcdir}/*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
