# Contributor: Dylan Delgado <dylan1496@live.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="dancing-script"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=2.031
pkgrel=1
pkgdesc="Lively casual script where the letters bounce and change size slightly, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/dancing/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=()
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://github.com/impallari/DancingScript/archive/master.zip")
sha256sums=('a8542e3755da46199cbd6b53943205e7106d6668759678f586de2951914ec630')

package() {
  cd ${srcdir}/DancingScript-master/

  install -dm755 "${pkgdir}/usr/share/fonts/OTF/${_group}"
  install -Dpm644 fonts/*.otf "${pkgdir}/usr/share/fonts/OTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 AUTHORS.txt CONTRIBUTORS.txt DESCRIPTION.en_us.html FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
