# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cgol-tui-rs-bin
pkgver=0.6.10
pkgrel=1
pkgdesc="Conway's Game of Life viewer with a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/jarjk/cgol-tui-rs"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/cgol-tui-rs-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/cgol-tui-rs-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('a7b00111c6c27fcfdba186dd660d2618da03aa5b69caa43645bcf76d9f297dad')
sha256sums_aarch64=('6fb05b6de7796ebd41dfcd2c5869594314aa50443c708030d6f749a271d62cd3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cgol-tui-rs"
}
