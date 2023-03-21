# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="formal-script-for-the-web"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.001
pkgrel=4
pkgdesc="A Formal Script for the web, from Pablo Impallari"
arch=(any)
#url="http://www.impallari.com/projects/overview/formal-script-for-the-web"
url="https://github.com/impallari"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig')
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://fonts.google.com/download?family=Petit%20Formal%20Script")
md5sums=('c9e8e974e2f5f75570dc9ecbe290b709')

package() {
  cd ${srcdir}/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt *.png "${pkgdir}/usr/share/doc/${pkgname}/"
}
