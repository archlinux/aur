# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="EM-C7100BAM"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.31
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/16/35/77/744ae408a614e90db8ba737e51e48c52faf3063b/Epson-${_Name}_PS.ppd.gz")
sha256sums=('0dd8cb425153aae488909e04f36be510401b7fff3c9f438d60bb920dae61d4bc')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_PS.ppd"
}
