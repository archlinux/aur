# Maintainer: hi@devan.gg
pkgname=go-cli-package
_binname=go-cli-package
pkgver=0.3.7
pkgrel=1
pkgdesc="A go cli to publish your go cli package."
arch=('x86_64' 'aarch64')
url="https://devan.gg/go-cli-package"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/go-cli-package/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/go-cli-package/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('0af10f272f9774f72687a1b2fbf2011b3f92dac6f62e3af2f908694810449b44')
sha256sums_aarch64=('8cbd28d617e86e9dd519cb326dd21ad73b8b98569b654196e55fe045eb1d5de5')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
