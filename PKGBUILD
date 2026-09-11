# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=oapi-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="OpenAPI command-line client written in Rust (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/lloydzhou/oapi"
license=('MIT')
provides=('oapi')
conflicts=('oapi')
depends=('ca-certificates')
source_x86_64=("oapi-linux-amd64::https://github.com/lloydzhou/oapi/releases/download/v${pkgver}/oapi-linux-amd64")
source_aarch64=("oapi-linux-arm64::https://github.com/lloydzhou/oapi/releases/download/v${pkgver}/oapi-linux-arm64")
sha256sums_x86_64=('7860f1a6c177c73b21d18d1f94d27dfecca84f3685ec118f0713a3b4cf9bca2a')
sha256sums_aarch64=('766fcb57cbcd98c6041ad5b0d217de2fda08828375db752cc45366663efa0b51')
options=('!strip')

_binarch() {
  case "$CARCH" in
    x86_64)  echo amd64 ;;
    aarch64) echo arm64 ;;
  esac
}

package() {
  install -Dm755 "${srcdir}/oapi-linux-$(_binarch)" "${pkgdir}/usr/bin/oapi"
}
