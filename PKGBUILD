# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AM-C6000"
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
source=("${_pkgsrc}.ppd.gz::https://download3.ebz.epson.net/dsc/f/03/00/14/10/43/a7072337ed8e501584445bf1627820bc46a6baaa/Epson-${_Name}_Series_PS.ppd.gz")
sha256sums=('42b7cc7e71ec263d8caa3fe9649632d7e38a50c69b6fb6bb32e3560e75e02f80')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}_Series_PS.ppd"
}
