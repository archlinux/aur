# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AM-C4000"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.24
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name}, ${_Name}a)"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/14/10/39/1bb18e72abf717eddb3f42eb68d3bee2d6b9c247/Epson-${_Name}_Series_PS.ppd.gz")
sha256sums=('aa687c3ffcd98125eb952027164db15b2993ffed65bd18e0bd3fe3a3beb47115')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_Series_PS.ppd"
}
