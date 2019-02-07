# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="libre-baskerville"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.0
pkgrel=1
pkgdesc="Libre Baskerville is webfont optimized for web body text, from Pablo Impallari"
arch=(any)
url="https://github.com/impallari/Libre-Baskerville"
screenshot="http://www.impallari.com/media/uploads/profotos/132-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("Libre-Baskerville-master.zip::https://codeload.github.com/impallari/Libre-Baskerville/zip/master")
md5sums=('051941308b8f7446ee8a2fe877e76d60')

package() {
  cd ${srcdir}/Libre-Baskerville-master

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
