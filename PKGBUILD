# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="dosis"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.7
pkgrel=1
pkgdesc="Very simple, rounded, sans serif font family, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/${_font}/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/releases/${_font}-v${pkgver}.zip")
md5sums=('953fc04aaeccf773cdce445b96830f1d')

package() {
  cd ${srcdir}/*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
