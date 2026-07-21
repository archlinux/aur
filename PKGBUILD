# Maintainer: hi@devan.gg
pkgname=timr-cli
_binname=timr
pkgver=0.4.1
pkgrel=1
pkgdesc="A simple cli timer"
arch=('x86_64' 'aarch64')
url="https://devan.gg/timr"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('9a8082354dd65e6e169b7a7f6e69fba7bedfc70e9acd857684395d87e7f354e0')
sha256sums_aarch64=('a0de59d80a22aa9d4e608a4a012f742e19d0a59d779bd841080ad01ea9f81ddc')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
