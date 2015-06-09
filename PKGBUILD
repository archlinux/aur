# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="encode-sans"
_group="impallari"
_update="106"
pkgname=ttf-${_group}-${_font}
pkgver=1.000
pkgrel=1
pkgdesc="Encode Sans Font: Obsessively optimized for the web, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/encode"
screenshot="http://www.impallari.com/media/uploads/profotos/135-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-${_update}-source.zip")
md5sums=('cec291f414c9b4020395b095c04594aa')

package() {
  cd ${srcdir}/E*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
