# Contributor: mokman <mokmail@web.de>

_font="cabin-font"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=2.2
pkgrel=2
pkgdesc="A humanist sans inspired by Edward Johnston's and Eric Gill's typefaces, from Pablo Impallari"
arch=(any)
url="https://github.com/impallari"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-util')
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://codeload.github.com/impallari/Cabin/zip/master")
md5sums=('SKIP')

package() {
  cd "${srcdir}/Cabin-master"

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 fonts/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md TRADEMARKS.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
