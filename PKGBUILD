# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="dancing-script"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=2.000
pkgrel=2
pkgdesc="Lively casual script where the letters bounce and change size slightly, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/dancing/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=()
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://github.com/impallari/DancingScript/archive/master.zip")
md5sums=('bad057ff904f9963fb3ed1eab915a5e2')

package() {
  cd ${srcdir}/DancingScript-master/

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/${_group}"
  install -Dpm644 fonts/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 AUTHORS.txt CONTRIBUTORS.txt DESCRIPTION.en_us.html FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
