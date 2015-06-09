# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="cancelleresca-bastarda"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=beta28
pkgrel=1
pkgdesc="Designed by Jan van Krimpen in 1934 (OTF), from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/projects/overview/jan-van-krimpen-cancelleresca-bastarda-revival"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
source=("http://www.impallari.com/media/uploads/prosources/update-38-source.zip")
md5sums=('7b3ef5b7a371165800847c0423b76fad')

package() {
  cd ${srcdir}/B*

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.otf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 FONTLOG.txt *.png "${pkgdir}/usr/share/doc/${pkgname}/"
}
