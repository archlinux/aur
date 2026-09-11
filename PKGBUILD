# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=mcpc-bin
pkgver=0.1.1
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
sha256sums_x86_64=('9990695617b6ed5801ec610b52a5d21811c692a250f78ba659c0d042712d911b')
sha256sums_aarch64=('9cd36f5db027d71722af99ecedde62abc24fcea70329f09aba8b7ebf09b64bbf')
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
