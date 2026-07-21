# Maintainer: hi@devan.gg
pkgname=timr-cli
_binname=timr
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple cli timer"
arch=('x86_64' 'aarch64')
url="https://devan.gg/timr"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('db096c33b7b01be50a8ae465d82640ac166ee9885e95869b388be78add5c6fdf')
sha256sums_aarch64=('0eabe77826ce1297425d64e25ad59750ac46a8f7287facaa745e91f87d126d18')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
