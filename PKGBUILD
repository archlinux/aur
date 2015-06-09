# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="poetsen-one"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.000
pkgrel=1
pkgdesc="Inspired by the hand painted signs in supermarkets, from Pablo Impallari"
arch=(any)
#url="http://www.impallari.com/${_font}/"
url="http://www.impallari.com/projects/overview/${_font}/"
screenshot="http://www.impallari.com/media/uploads/profotos/107-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-70-source.zip")
md5sums=('c232c0e1921e4b4273c72100d7387eb3')

package() {
  cd ${srcdir}/P*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
