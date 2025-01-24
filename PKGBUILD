# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="EM-C800"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.31
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/15/93/23/a6c96dc692c2d2f9f66d9845baafd81474ee797e/Epson-${_Name}_Series_PS.ppd.gz")
sha256sums=('2c495f01d40a47b489bd067f4da3e234864c88ee66cd7775fe749e48bb1ebeca')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_Series_PS.ppd"
}
