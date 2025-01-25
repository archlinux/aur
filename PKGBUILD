# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LM-C6000"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.24
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/14/15/41/29855d0a960ebf7ea5edb4bad002ca4e1c328eba/Epson-${_Name}_PS.ppd.gz")
sha256sums=('f05c02ffb464593568f45e9391fceb78a4f12e765e5ca98e73ecfa0bf6fca42d')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_PS.ppd"
}
