# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="raleway-family"
_group="impallari"
_update=100
pkgname=ttf-${_group}-${_font}
pkgver=3.0
pkgrel=1
pkgdesc="Matt McInerney's Raleway family, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-raleway')
provides=('ttf-raleway')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-${_update}-source.zip")
md5sums=('fd753c68236f5c712a89bb798a90c4a1')

package() {
  cd ${srcdir}/r*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
