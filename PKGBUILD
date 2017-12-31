# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="lobster-font"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=1.7
pkgrel=1
pkgdesc="A lovely bold condensed script (OTF), from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/lobster/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=('fontconfig' 'xorg-font-utils')
install=updatefont.install
#source=("http://www.impallari.com/media/releases/${_font}-${pkgver}.zip")
#md5sums=('ed3c3873340a17276a8ad556ecf3da5a')
#source=("${_font}-${pkgver}.zip::https://fonts.google.com/download?family=Lobster")
#md5sums=('72a360e59e977abb5e92a6bdbc3d6740')
source=("${_font}-${pkgver}.zip::https://github.com/impallari/The-Lobster-Font/archive/master.zip")
md5sums=('8c3d8eee96154344d44c91a7275f389c')

package() {
  cd ${srcdir}/The-Lobster-Font-master

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 fonts/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 DESCRIPTION.en_us.html README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
