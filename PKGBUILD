# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="cantora"
_group="impallari"
_update=67
pkgname=ttf-${_group}-${_font}
pkgver=1.001
pkgrel=1
pkgdesc="Cantora ('Singer' in Spanish) is a friendly semi formal, semi condensed, semi sans serif, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-${_update}-source.zip")
md5sums=('4406a0c9a8ee2a4de1352e74f0640bb7')

package() {
  cd ${srcdir}/C*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
