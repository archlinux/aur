# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=leantoken-bin
pkgver=0.1.28
pkgrel=1
pkgdesc="Code intelligence for AI agents that keeps context lean"
arch=('x86_64' 'aarch64')
url="https://github.com/morluto/leantoken"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/leantoken-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/leantoken-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('4cb2eb821407e5adb0eab67ba5b7450bb854e1df09e54cd105f53ad6bc8c3a55')
sha256sums_aarch64=('d016cca7a671f7b779fed7ea736bca7bde4235223828e4690593966ce9c5127a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="leantoken-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="leantoken-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/leantoken" "${pkgdir}/usr/bin/leantoken"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
