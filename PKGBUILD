# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=open-max-bin
pkgver=2026.11.6
pkgrel=1
pkgdesc="Minimal Rust terminal harness for coding agents, small, fast and self-extensible"
arch=('x86_64' 'aarch64')
url="https://github.com/Max17190/open-max"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/openmax-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/openmax-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('ba4e5e17e52d7374cf2eb151ea58899a4c18ad6010d530fe8d3a4cbc85319fc6')
sha256sums_aarch64=('e84ac89f1bc6658b0242e7c0bbea24500799471d9baf9b24cc9f09c7042b2cee')

package() {
  cd "openmax-${CARCH}-unknown-linux-gnu"
  install -Dm755 "openmax" "${pkgdir}/usr/bin/openmax"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
