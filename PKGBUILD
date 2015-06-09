# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="libre-caslon-display"
_group="impallari"
_update=107
pkgname=ttf-${_group}-${_font}
pkgver=1.0
pkgrel=1
pkgdesc="Libre Caslon in Display style, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/libre-caslon-display-and-text"
screenshot="http://www.impallari.com/media/uploads/proupdates/94-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-${_update}-source.zip")
md5sums=('e961ccf468a1a5f12f63fbf505c2bd03')

package() {
  cd ${srcdir}/L*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
