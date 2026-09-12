# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=oapi-bin
pkgver=0.1.2
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
sha256sums_x86_64=('abbc1b235695cdb777cb9799e22761f7ca0bbdb4e6575e6f5ab4ed09c85c0015')
sha256sums_aarch64=('649d7788218594de9760049494ea2128a2235ecc0238b975d8bddb78e1159bb4')
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
