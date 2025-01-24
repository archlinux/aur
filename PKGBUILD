# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AL-M300"
_model="${_Name,,}"
pkgname="epson-laser-printer-${_model}"
pkgver=1.0.0 # 'latest'
pkgrel=1
pkgdesc="Epson laser printer driver (${_Name})"
arch=('any')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('MIT')
depends=('cups')
_pkgsrc="${_model}-${pkgver}"
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${_pkgsrc}.ppd::https://download.ebz.epson.net/dsc/f/01/00/02/17/83/3f3597f2adfa6d5939dacd27d4aaed26e14bb43a/EPALM30.ppd")
sha256sums=('660305b7edc78ab9d858a85a51d8ae530743946b1aa4b0c27fb530c704f654c6')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/EPALM30.ppd"
}
