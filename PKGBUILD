# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=oapi-bin
pkgver=0.1.5
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
sha256sums_x86_64=('65ae2144220d9dbface95d6988e938e7560f3d639fa40cc78dbdd1312f9c3703')
sha256sums_aarch64=('d931f87e265d355825b9c1ed433c5ee881fe1b2d3630c6bad02ed0aa9343b01c')
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
