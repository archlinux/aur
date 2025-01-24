# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AM-C400"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name}, ${_Name}a)"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/15/77/45/48684dc957257daf8eb6f8e41ce68190fd1783b5/Epson-${_Name}_Series_PS.ppd.gz")
sha256sums=('75f5507fbbd20011117e5dc1c4918b97499c601c98e16dc463ac1e7c0881b837')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_Series_PS.ppd"
}
