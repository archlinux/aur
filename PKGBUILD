# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LP-S280DN"
_model="${_Name,,}"
pkgname="epson-laser-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson laser printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:GPL-?.0-unknown')
depends=('cups' 'cups-filters' 'ghostscript')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/06/06/50/a62d37bfee1cbfd32dfd7845b4226ee981c20b74/${_Name}.ppd")
sha256sums=('aeb23ae1faeb03021bd94790618ae1686cfbc8dc63971c4504b9798bb4325322')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}-eplaser-jp.ppd"
}
