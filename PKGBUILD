# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="dancing-script"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.2
pkgrel=1
pkgdesc="Lively casual script where the letters bounce and change size slightly, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/dancing/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/releases/${_font}-v${pkgver}.zip")
md5sums=('2dff08125b75464d697b83c1d931b136')

package() {
  cd ${srcdir}/*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
