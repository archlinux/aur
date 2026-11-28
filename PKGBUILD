# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=catchlight-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Realtime 2.5D character animation editor"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperlogue/catchlight"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/catchlight-editor-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/catchlight-editor-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('58a2e865967fc04ce7089dde5785aba80abe2d34053e91f8d872b935954338b1')
sha256sums_aarch64=('2b2a775b148652c62294b2e35afbb18d3d7c11af933a24e2a8e71122e75b66a7')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="catchlight-editor-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="catchlight-editor-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/catchlight-editor" "${pkgdir}/usr/bin/catchlight-editor"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
