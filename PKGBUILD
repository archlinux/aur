# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="new-rocker"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.0
pkgrel=1
pkgdesc="NewRocker is a loud, harsh, screaming font, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/${_font}/"
#screenshot="http://www.impallari.com/media/uploads/profotos/129-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
source=("New_Rocker.zip::https://fonts.google.com/download?family=New%20Rocker")
md5sums=('8187b82ba8976f254a443bf169b80097')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
