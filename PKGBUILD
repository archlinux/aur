# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="milonga"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.0
pkgrel=1
pkgdesc='Milonga is a Font inspired on “tangueros” art, from Pablo Impallari'
arch=(any)
url="http://www.impallari.com/projects/overview/${_font}/"
screenshot="http://www.impallari.com/media/uploads/proupdates/82-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("Milonga.zip::https://fonts.google.com/download?family=Milonga")
md5sums=('7dcc574ddbd7a35be07bf7aa1f825e2a')

package() {
  cd ${srcdir}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
