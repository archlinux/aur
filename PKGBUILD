# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LP-S8160"
_model="${_Name,,}"
pkgname="epson-laser-printer-${_model}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson laser printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:GPL-?.0-unknown')
depends=('cups' 'cups-filters' 'ghostscript')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/05/87/37/68ca04ae8a0c61e016dc515337bec9e70c16c6f9/Epson-${_Name}-eplaser-jp.ppd")
sha256sums=('0f9dc4cd9e286f03508a1cb5fe4de56c86c769bc260657a01df1ca1d25b683a0')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}-eplaser-jp.ppd"
}
