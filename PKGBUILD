# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="miltonian"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.007
pkgrel=1
pkgdesc="Two playful fonts for all your informal needs, from Pablo Impallari"
arch=(any)
url="https://github.com/impallari/Miltonian"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("Miltonian-master.zip::https://codeload.github.com/impallari/Miltonian/zip/master")
md5sums=('3e33d91d524c322c87d5862c1591e5b4')

package() {
  cd ${srcdir}/Miltonian-master

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 fonts/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
