# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cliproxy-rs-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="Local endpoint to use DeepSeek, GLM, Kimi and OpenRouter models in Codex CLI and Claude Code"
arch=('x86_64' 'aarch64')
url="https://github.com/vayungodara/cliproxy-rs"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cliproxy-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cliproxy-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('683bc012b123c7759ba8f023c91bad63fdedd9e68b06ecc6b676e034ec0bfa7f')
sha256sums_aarch64=('0b317524ef836968c259b6fcb0c1f5a0a34e3420f9a7257037fbde90bb554cff')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="cliproxy-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="cliproxy-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/cliproxy" "${pkgdir}/usr/bin/cliproxy"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
