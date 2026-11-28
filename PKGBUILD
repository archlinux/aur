# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chrome-protocol-proxy-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Chrome DevTools Protocol proxy for debugging"
arch=('x86_64' 'aarch64')
url="https://github.com/wendigo/chrome-protocol-proxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chrome-protocol-proxy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chrome-protocol-proxy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2d205235db948f01d52eb5058c232b0a41d9bf4a3f624a9889bd69d94b3b0747')
sha256sums_aarch64=('f3b1ee421ba3867e7fa74ba63f6a9db80302fcb636868d3a5dfb92931750a45a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="chrome-protocol-proxy_${pkgver}_linux_amd64" ;;
    aarch64) _dir="chrome-protocol-proxy_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/chrome-protocol-proxy" "${pkgdir}/usr/bin/chrome-protocol-proxy"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
