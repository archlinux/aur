# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AM-C550"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.26
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/15/77/48/0b760d3ad99e35ead5b9cdeaf72729c2971514fe/Epson-${_Name}_Series_PS.ppd.gz")
sha256sums=('e80cea6eda642535e4a316b18c02b1169d125cac3f30485d6c926688f149f6ef')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_Series_PS.ppd"
}
