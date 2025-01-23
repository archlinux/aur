# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AL-M7100DN"
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
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/03/42/22/727313d46e877ed9010a9f2c0e0444ed5a77ffa2/EPSON_${_Name}_PS3.ppd")
sha256sums=('47332cecd2125b6569783d23ac1c066190907d9ac454152a1d4faccd2f9100b9')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/EPSON_${_Name}_PS3.ppd"
}
