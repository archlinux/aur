pkgname=blackbox-explorer-bin
_pkgname=blackbox-explorer
pkgver=3.5.0
pkgrel=1
pkgdesc="Interactive log viewer for flight logs recorded with blackbox"
arch=('x86_64')
url="https://github.com/betaflight/blackbox-log-viewer"

source=("https://github.com/betaflight/blackbox-log-viewer/releases/download/${pkgver}/betaflight-blackbox-explorer_${pkgver}_linux64.zip")
sha256sums=('39361b72e254824e3bf270df9ecb0451480e49e5625eb99962df3b542cf25c5e')

options=(!strip)
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r --preserve=all "${srcdir}/Betaflight Blackbox Explorer/." "${pkgdir}/opt/${_pkgname}"
  ln -s "/opt/${_pkgname}/betaflight-blackbox-explorer" "$pkgdir/usr/bin/${_pkgname}"
}
