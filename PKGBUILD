# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="encode-sans"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=2.000
pkgrel=1
pkgdesc="Encode Sans Font: Obsessively optimized for the web, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/encode"
screenshot="http://www.impallari.com/media/uploads/profotos/135-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://github.com/impallari/Encode-Sans/archive/master.zip")
md5sums=('b38a26b123ecb84df4152b998e8dd031')

package() {
  cd ${srcdir}/Encode-Sans-master/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 fonts/*.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 AUTHORS.txt CONTRIBUTORS.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
