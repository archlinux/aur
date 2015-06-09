# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="cabin-sketch"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.02
pkgrel=1
pkgdesc="Other humanist sans inspired by Edward Johnston's and Eric Gill's typefaces, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/cabinsketch/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/releases/${_font}-v${pkgver}.zip")
md5sums=('9af225d28f65530b6ac7732125ef0da2')

package() {
  cd ${srcdir}/*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

#  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
#  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
