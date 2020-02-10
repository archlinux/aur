# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="libre-caslon-display"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.002
pkgrel=1
pkgdesc="Libre Caslon in Display style, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/libre-caslon-display-and-text"
screenshot="http://www.impallari.com/media/uploads/proupdates/94-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://github.com/impallari/Libre-Caslon-Display/archive/master.zip")
md5sums=('648fd3351f41cb73d2bd3d4dab1f9338')

package() {
  cd ${srcdir}/Libre-Caslon-Display-master

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 fonts/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
