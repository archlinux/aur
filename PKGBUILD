# Maintainer: Marcos Heredia <chelqo@gmail.com>

_name="Amiko-Devanagari"
_font="amiko-devanagari"
_group="impallari"
pkgname=otf-${_group}-${_font}
pkgver=1.000
pkgrel=1
pkgdesc="Amiko is a clean and utilitarian Devanagari and Latin typeface family, from Pablo Impallari"
arch=(any)
#url="http://www.impallari.com/"
url="https://github.com/impallari"
screenshot="https://github.com/impallari/Amiko-Devanagari/blob/master/documentation/screenshots/v0028%20devanagari%20-%2014%20to%209%20px.png"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
source=("${_font}-${pkgver}.zip::https://github.com/impallari/${_name}/archive/master.zip")
md5sums=('17b8cc52a2a33bb166c1075a53fc1ed7')

package() {
  cd ${srcdir}//${_name}-master/

  install -dm755 "${pkgdir}/usr/share/fonts/OTF/${_group}"
  install -Dpm644 fonts/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
