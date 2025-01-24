# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="EM-C800BAM"
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
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/16/06/87/3205481cb86f6dde1428442ba0198ba34712cdca/Epson-${_Name}_PS.ppd.gz")
sha256sums=('f389c40512ad9bf5758902076eba99d64de8b8e2500933046d65fb2eb973c71e')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_PS.ppd"
}
