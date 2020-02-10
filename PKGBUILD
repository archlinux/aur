# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="kaushan-script"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.002
pkgrel=2
pkgdesc="Feels like writing quickly with an inked brush, from Pablo Impallari"
arch=(any)
#url="http://www.impallari.com/kaushan/"
url="https://github.com/impallari"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://fonts.google.com/download?family=Kaushan%20Script")
md5sums=('29974ac1c48376411e36d4c4fbdfb7b2')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
