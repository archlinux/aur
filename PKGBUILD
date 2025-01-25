# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="L6580"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/11/03/52/faaafd73a4d29eef558d0b282462ff9e9fe468d7/EPSON_${_Name}_Series_PS.ppd.gz")
sha256sums=('e26c48c45020e5f3819c4c4a44413cbf9dcc9842deae632a9df285525f456ea4')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/EPSON_${_Name}_Series_PS.ppd"
}
