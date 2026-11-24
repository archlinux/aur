# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=oapi-bin
pkgver=0.1.4
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
sha256sums_x86_64=('462993e292b034ff5107fb69fae490b6fe6f0f40b708efa13188aa11c294df8b')
sha256sums_aarch64=('17b8f74df314f45999780242a7a59a93ac99d9bf2742845b9389f8bebdb7f5bf')
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
