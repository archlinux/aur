# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="raleway-family"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=3.000
pkgrel=2
pkgdesc="Matt McInerney's Raleway family, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-raleway')
provides=('ttf-raleway')
#install=updatefont.install
source=("Raleway.zip::https://fonts.google.com/download?family=Raleway")
md5sums=('e0a8500e30cf534ebfa180903be954d2')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
