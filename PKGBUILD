# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AL-M8250DN"
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
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/12/76/82/007eb345afba700c3fe6592531d17bb4c0bc4050/Epson-${_Name}_Series_PS.ppd.gz")
sha256sums=('6f05bb8966ec592f87281351ec43e3c347ccb3509032aa2b828c616823ee3d5a')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_Series_PS.ppd"
}
