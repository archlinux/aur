# Maintainer: hi@devan.gg
pkgname=bookmark-plus
_binname=bookmark
pkgver=1.2.0
pkgrel=1
pkgdesc="A bookmark manager for your favorite shell"
arch=('x86_64' 'aarch64')
url="https://devan.gg/bookmark"
license=('MIT')
depends=()

source_x86_64=("${_binname}-linux-amd64-${pkgver}.tar.gz::https://github.com/imdevan/bookmark/releases/download/v${pkgver}/${_binname}-linux-amd64.tar.gz")
source_aarch64=("${_binname}-linux-arm64-${pkgver}.tar.gz::https://github.com/imdevan/bookmark/releases/download/v${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('7da8be425c4b15fc5396ff27a25fa932f4812178c651b0a5e0cc0f7f9b1f8aed')
sha256sums_aarch64=('dca1a12d22a2dbd9639d2d0eeb1cb834c77b7bdf68b82f9a167c6900c61e82d9')

package() {
  if [ "${CARCH}" = "x86_64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-amd64" "${pkgdir}/usr/bin/${_binname}"
  elif [ "${CARCH}" = "aarch64" ]; then
    install -Dm755 "${srcdir}/${_binname}-linux-arm64" "${pkgdir}/usr/bin/${_binname}"
  fi
}
