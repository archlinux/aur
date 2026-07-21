# Maintainer: hi@devan.gg
pkgname=timr-cli
_binname=timr
pkgver=0.4.0
pkgrel=1
pkgdesc="A simple cli timer"
arch=('x86_64' 'aarch64')
url="https://devan.gg/timr"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('ed7bf675f51b0d0cf04b4a9e4faab2c9956232d8d02837f85150bd74b11ea997')
sha256sums_aarch64=('e4e504018c59365de839f0e1ab0be14dc6154544e1de47b556ca22dca53336f2')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
