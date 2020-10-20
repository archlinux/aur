# Contributor: Dylan Delgado <dylan1496@live.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="cabin-sketch"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.100
pkgrel=2
pkgdesc="Other humanist sans inspired by Edward Johnston's and Eric Gill's typefaces, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/cabinsketch/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=()
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://github.com/impallari/CabinSketch/archive/master.zip")
md5sums=('b6ed40b8bcc486a2bb5442a853286eee')

package() {
  cd ${srcdir}/CabinSketch-master/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 fonts/*.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 DESCRIPTION.en_us.html FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
