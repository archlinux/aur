# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="quattrocento-sans"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=2.0
pkgrel=1
pkgdesc="Classic, Elegant & Sober typeface, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/quattrocentosans/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-19-source.zip")
md5sums=('f27e2fd6b5537dd74869cfc834963bc9')

package() {
  cd ${srcdir}/q*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
