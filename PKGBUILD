# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="EM-C7100"
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
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/16/33/79/94a8ea1ef47188240156c5c84415671c96c43e45/Epson-${_Name}_Series_PS.ppd.gz")
sha256sums=('a788a20d593cc8db1d49a786c7ccc87a73740f27ae3c368f9927f47192b99565')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_Series_PS.ppd"
}
