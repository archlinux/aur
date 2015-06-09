# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="lobster-font"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.4
pkgrel=1
pkgdesc="A lovely bold condensed script (OTF), from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/lobster/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/releases/${_font}-${pkgver}.zip")
md5sums=('ed3c3873340a17276a8ad556ecf3da5a')

package() {
  cd ${srcdir}/*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.otf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 Readme.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
