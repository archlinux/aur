# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="libre-franklin"
_group="impallari"
pkgname=otf-${_group}-${_font}
pkgver=4.015
pkgrel=1
pkgdesc="The quintessential american typeface, from Pablo Impallari"
arch=(any)
#url="http://www.impallari.com/"
url="https://github.com/impallari"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-impallari-libre-franklin')
#provides=('')
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://github.com/impallari/Libre-Franklin/archive/master.zip")
md5sums=('7a31ce57dc8c45173f6ff201fb476727')

package() {
  cd ${srcdir}/Libre-Franklin-master/

  install -dm755 "${pkgdir}/usr/share/fonts/OTF/${_group}"
  install -Dpm644 fonts/OTF/*.otf "${pkgdir}/usr/share/fonts/OTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
