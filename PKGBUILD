# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="LP-S3250"
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
source=("${_pkgsrc}.ppd::https://download3.ebz.epson.net/dsc/f/03/00/05/87/38/8ab77903be70a617c6bb8ff3c5d8ef818a950fba/Epson-${_Name}-eplaser-jp.ppd")
sha256sums=('11b044d66c7e27c38237cdaa7c901c75b125be6bb04d1c238c66fbe2b24bfcfd')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}.ppd" "${pkgdir}/usr/share/cups/model/${pkgname}/Epson-${_Name}-eplaser-jp.ppd"
}
