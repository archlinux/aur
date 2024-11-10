# Contributor: Dylan Delgado <dylan1496@live.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

_font="dancing-script"
_group="impallari"
pkgname=ttf-${_group}-${_font}
pkgver=3.000
pkgrel=1
pkgdesc="Lively casual script where the letters bounce and change size slightly, from Pablo Impallari"
arch=(any)
url="http://www.impallari.com/dancing/"
license=('custom:OFL')
groups=("${_group}-fonts")
depends=()
#install=updatefont.install
source=("${_font}-${pkgver}.zip::https://github.com/impallari/DancingScript/archive/master.zip")
sha256sums=('4d5f8b95d884345a352b951a53a18a2ac0c0bd7203818ebbc0a6100657da11c1')

package() {
  cd ${srcdir}/DancingScript-master/

  install -dm755 "${pkgdir}/usr/share/fonts/OTF/${_group}"
  install -Dpm644 fonts/*.otf "${pkgdir}/usr/share/fonts/OTF/${_group}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dpm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dpm644 AUTHORS.txt CONTRIBUTORS.txt DESCRIPTION.en_us.html FONTLOG.txt README.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
