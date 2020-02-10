# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="raleway-family"
_group="impallari"
pkgname=otf-${_group}-${_font}
pkgver=4.020
_pkgver=v4020
pkgrel=1
pkgdesc="Matt McInerney's Raleway family, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
conflicts=('otf-raleway' 'ttf-impallari-raleway-family')
provides=('otf-raleway')
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://github.com/impallari/Raleway/archive/master.zip")
md5sums=('643bfae379a973891fd5251db6f6b7a9')

package() {
  cd ${srcdir}/Raleway-master/

  install -dm755 "${pkgdir}/usr/share/fonts/OTF/${_group}"
  install -Dpm644 fonts/${_pkgver}/*.otf "${pkgdir}/usr/share/fonts/OTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 CONTRIBUTORS.txt FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
