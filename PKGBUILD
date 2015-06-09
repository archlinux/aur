# Maintainer: Marcos Heredia <chelqo@gmail.com>

_font="neuton-serif-family"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.46
pkgrel=1
pkgdesc="A classy blend of simplification, curvature, and angles, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/${_font}/"
screenshot="http://www.impallari.com/media/uploads/profotos/68-foto01-original.jpg"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-25-source.zip")
md5sums=('28e071cc9185097b7f7df6d76c2d5db7')

package() {
  cd ${srcdir}/${pkgver}

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt "${pkgdir}/usr/share/doc/${pkgname}/"
}
