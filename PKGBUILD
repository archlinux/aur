# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AL-C300DN"
_model="${_Name,,}"
pkgname="epson-laser-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson laser printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('MIT')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/03/22/13/850a69ee09cf45d75afa9fbcb7f12b8247988ab4/ep${_model//-/}.ppd")
sha256sums=('5c328a1e93509ea40e4b0b67785ef663f091f1a18d469d0d16f31150fd8ade4d')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/ep${_model//-/}.ppd"
}
