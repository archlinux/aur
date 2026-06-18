# Maintainer: hi@devan.gg
pkgname=l
_binname=l
pkgver=0.3.0
pkgrel=1
pkgdesc="an ls replacement"
arch=('x86_64' 'aarch64')
url="https://devan.gg/l"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/l/releases/download/v0.3.0/l-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/l/releases/download/v0.3.0/l-linux-arm64.tar.gz")
sha256sums_x86_64=('59ca517fc81cefe20dcba026fb46f7aa241d33f9bb8821e6e6b484b32b0e40c1')
sha256sums_aarch64=('9ac8e26ff761b7900be9bca3ff2cfb006bbaf5766abf14cf56ae8116d79bedc2')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
