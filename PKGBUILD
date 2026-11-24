# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zoetrope-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Watch a Claude Code or Codex session as a live flow graph"
arch=('x86_64' 'aarch64')
url="https://github.com/furkankly/zoetrope"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zoetrope-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zoetrope-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('62e73697984c1228c55367a224598374a241d3638881af88949929ea33eb5bef')
sha256sums_aarch64=('364142829c15beed1c81695b85433e3994fd8b5b2c49ccd326b3d4722e9f331b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="zoetrope-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="zoetrope-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/zoe" "${pkgdir}/usr/bin/zoe"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
