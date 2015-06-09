# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="formal-script-for-the-web"
_group="impallari"
_update=66
pkgname=ttf-${_group}-${_font}
pkgver=1.001
pkgrel=1
pkgdesc="A Formal Script for the web, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/formal-script-for-the-web"
screenshot="http://www.impallari.com/media/uploads/profotos/79-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-${_update}-source.zip")
md5sums=('8eefef575bc628275f0c8b73767cc67f')

package() {
  cd ${srcdir}/p*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt *.png "${pkgdir}/usr/share/doc/${pkgname}/"
}
