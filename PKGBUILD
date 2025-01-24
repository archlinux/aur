# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="WF-5190"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name}, WF-5191)"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('MIT')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/02/77/28/4d72278c3a83841bddcaf8cac4f27c91ce1c4316/EP${_Name//-/}.PPD")
sha256sums=('e3fab55223ebf8240ba24f4299311487c0b5ef534d04bbc6ff4c848759b9a13a')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/EP${_Name//-/}.ppd"
}
