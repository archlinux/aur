# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AL-M320DN"
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
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/05/80/97/25351438c8b38494e137f744a84f44a4ee500600/Epson-${_Name}_PS.ppd")
sha256sums=('b51babfc850cb8aa08dcc1c0fc9979572bc5c18cfc669b19e17d8b43a516c768')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_PS.ppd"
}
