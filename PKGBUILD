# Maintainer: hi@devan.gg
pkgname=bookmark-plus
_binname=bookmark
pkgver=1.1.0
pkgrel=1
pkgdesc="A bookmark manager for your favorite shell"
arch=('x86_64' 'aarch64')
url="https://devan.gg/bookmark"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/bookmark/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/bookmark/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('6aaf2e49ea7dceb0b90367f57c8ed17ccf200c7edc5a099c0388a0a51cded937')
sha256sums_aarch64=('382513aa1846259e09aa7d6355829aae32caea5d548703dd7df610e8b9cd1cc5')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
