# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="lobstertwo"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.006
pkgrel=3
pkgdesc="Other lovely bold condensed script, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/${_font}/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
source=(
  "Lobster_Two.zip::https://fonts.google.com/download?family=Lobster%20Two"
#  "https://googlefontdirectory.googlecode.com/hg/ofl/lobstertwo/FONTLOG.txt"
  )
md5sums=(
  'a29e870297c1f120b89d50fcd28cd0a5'
#  '72c6cb64d60499ef3b5716cd2925705d'
  )

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

#  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
#  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
