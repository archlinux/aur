# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AL-M310DN"
_model="${_Name,,}"
pkgname="epson-laser-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson laser printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/05/80/98/f7ab4a7797b8c3244f324261c4483ae9bfde01b6/Epson-${_Name}_PS.ppd")
sha256sums=('71301baf6252a20cb3f0de809a60e42986f0d661f34b1d42588bd877514b7bfc')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_PS.ppd"
}
