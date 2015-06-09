# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="domine"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1
pkgrel=1
pkgdesc="Domine is a perfect choice for newspapers or blogs where text is the main focus, from Pablo Impallari"
arch=(any)
#url="http://www.impallari.com/${_font}/"
url="http://www.impallari.com/projects/overview/${_font}/"
screenshot="http://www.impallari.com/media/uploads/profotos/110-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
#source=("http://www.impallari.com/media/releases/${_font}-v${pkgver}.zip")
source=("http://www.impallari.com/media/uploads/prosources/update-85-source.zip")
md5sums=('d1a26da138ff1fe248a213e1fee651aa')

package() {
  cd ${srcdir}/D*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
