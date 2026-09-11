# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=mcpc-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="MCP client CLI with daemon-held sessions (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/lloydzhou/mcpc"
license=('MIT')
provides=('mcpc')
conflicts=('mcpc')
depends=('ca-certificates')
source_x86_64=("mcpc-linux-amd64::https://github.com/lloydzhou/mcpc/releases/download/v${pkgver}/mcpc-linux-amd64")
source_aarch64=("mcpc-linux-arm64::https://github.com/lloydzhou/mcpc/releases/download/v${pkgver}/mcpc-linux-arm64")
sha256sums_x86_64=('8b56d31a46bdc6b54c6d35c71afdae169bc0d4e89d4d90e0d856ef04e7433cbd')
sha256sums_aarch64=('5da82baa1c51951d9fe2f961a60128eb3fdf2cabf69f1d51bbe19464c04e8a2b')
options=('!strip')

_binarch() {
  case "$CARCH" in
    x86_64)  echo amd64 ;;
    aarch64) echo arm64 ;;
  esac
}

package() {
  install -Dm755 "${srcdir}/mcpc-linux-$(_binarch)" "${pkgdir}/usr/bin/mcpc"
}
