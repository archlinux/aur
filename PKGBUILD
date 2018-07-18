# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="domine"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.000
pkgrel=2
pkgdesc="Domine is a perfect choice for newspapers or blogs where text is the main focus, from Pablo Impallari"
arch=(any)
#url="http://www.impallari.com/${_font}/"
url="https://github.com/impallari"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://fonts.google.com/download?family=Domine")
md5sums=('4f5250e1552d3ef265bbadd193f6a07a')

package() {
  cd ${srcdir}/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
