# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="WF-6090"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name}, WF-6091, WF-6093)"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('MIT')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/04/23/00/241e35da63fbab7d7fa1298970816a206a747026/EP${_Name//-/}.PPD")
sha256sums=('ec5023042a39046ccead7ef0b4ab2b91aba1ea30dfc36cbce89d8639d7806683')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/EP${_Name//-/}.ppd"
}
