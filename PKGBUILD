# Contributor: Dylan Delgado <dylan1496@gmail.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="sniglet"
_group="impallari"
#_update=99
pkgname=ttf-${_group}-${_font}
pkgver=2.0
pkgrel=2
pkgdesc="A rounded display face that’s great for headlines, from Haley Fiege & Pablo Impallari"
arch=(any)
#url="http://www.impallari.com/"
url="http://www.impallari.com/projects/overview/sniglet-extension"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig')
conflicts=('ttf-sniglet' 'ttf-theleague-sniglet')
#install=updatefont.install
#source=("http://www.impallari.com/media/uploads/prosources/update-${_update}-source.zip")
source=("Sniglet.zip::https://fonts.google.com/download?family=Sniglet")
md5sums=('SKIP')

package() {
  cd ${srcdir}/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  #install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  #install -Dpm644 FONTLOG.txt *.png "${pkgdir}/usr/share/doc/${pkgname}/"
}
