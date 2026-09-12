# Maintainer: Lloyd <lloydzhou@qq.com>

pkgname=mcpc-bin
pkgver=0.2.0
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
sha256sums_x86_64=('5730fc6c7a1c2c4c2e778686d8e399263738e8e9018a247b1a1568fc62d340ea')
sha256sums_aarch64=('a7e6423da09ad6868541304c88c97e72ca14ba6acb5dae576cc221a81fa90761')
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
