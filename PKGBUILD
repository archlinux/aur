# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="hermeusone"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.0
pkgrel=1
pkgdesc="Hermeneus is a grecian style font, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-54-source.zip")
md5sums=('b245694e76c6e9091f987d39e67ea9ea')

package() {
  cd ${srcdir}/H*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
