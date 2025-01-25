# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LM-C4000"
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
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/14/15/39/76afc2623eb89a5979fa803df1b9f1a50fb377e6/Epson-${_Name}_PS.ppd.gz")
sha256sums=('470dd17dde65d9cb4f5b5bb7adde327bfbfb4c787ea2984f9fa13329a9d62602')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_PS.ppd"
}
