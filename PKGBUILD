# Maintainer: hi@devan.gg
pkgname=nator
_binname=nator
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple cli to create tmuxinator yml files for your current tmux session"
arch=('x86_64' 'aarch64')
url="https://devan.gg/nator"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/nator/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/nator/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('7b73a07db6bf357ad6e3d6e2d36db7f8bbcca91b548ceb6416df6a4c9bf226b6')
sha256sums_aarch64=('abf59be0523ccc535a77ae9746d63120d314d2622a4124fa11d653e3edce1c09')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
