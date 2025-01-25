# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="L15180"
_model="${_Name,,}"
pkgname="epson-inkjet-printer-${_model}"
pkgver=1.22
pkgrel=1
pkgdesc="Epson inkjet printer driver (${_Name}, L15188)"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/12/56/35/2551d308c77a7aa9a842f3af29db655161ca8f29/Epson_${_Name}_Series_PS.ppd.gz")
sha256sums=('14bb2dde094fdf4fea41dcd176536f765df880df585229bffd78c1a80a9c8994')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/EPSON_${_Name}_Series_PS.ppd"
}
