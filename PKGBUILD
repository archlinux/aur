# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="WF-5690"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('MIT')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/02/77/30/2c8303987d23fcc2160250f84f36821418911350/EP${_Name//-/}.PPD")
sha256sums=('948b58db96def379f958d5d069240507977d4ede2e61cccce41caa40882da95f')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/EP${_Name//-/}.ppd"
}
