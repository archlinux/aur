# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="raleway-dots"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.0
pkgrel=1
pkgdesc="A dotted version of Raleway, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-55-source.zip")
md5sums=('bd4538079ad667cf5f63f6d77cb2a503')

package() {
  cd ${srcdir}/R*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
