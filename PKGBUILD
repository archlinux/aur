# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LP-S4250"
_model="${_Name,,}"
pkgname="epson-laser-printer-${_model}"
pkgver=1.0.1
pkgrel=1
pkgdesc="Epson laser printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:GPL-?.0-unknown')
depends=('cups' 'cups-filters' 'ghostscript')
_pkgsrc="${_model}-${pkgver}"
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/05/87/39/af8b341948c166f081befab5bbe8ac9ce394398b/Epson-${_Name}-eplaser-jp.ppd")
sha256sums=('dc5824e0ad9a13ad3dd0c191cf6d198210bd9fd2b32c8621396ac2405672d5e1')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}-eplaser-jp.ppd"
}
