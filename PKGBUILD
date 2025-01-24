# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="WF-6590"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name}, WF-6593)"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('MIT')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/04/22/99/c09b5498342518193b72cd68de456ea6a8feefb8/EP${_Name//-/}.PPD")
sha256sums=('d9984e1fe14ea81fc5c1229b2454c99d8a4e95704f14e3c176dabe897df8f6ed')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/EP${_Name//-/}.ppd"
}
