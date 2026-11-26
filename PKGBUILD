# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=roundhouse-bin
pkgver=2026.9.18
pkgrel=1
pkgdesc="Build Rails applications for different deployment targets"
arch=('x86_64')
url="https://github.com/roundhouse-rb/roundhouse"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/roundhouse-x86_64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('aa8b13f53154ad41cc0a83088f6d4f06532760ec8dbeb165eccc0c946bcd7945')

package() {
  install -Dm755 "roundhouse-x86_64-unknown-linux-musl/roundhouse" "${pkgdir}/usr/bin/roundhouse"
  install -Dm644 "roundhouse-x86_64-unknown-linux-musl/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "roundhouse-x86_64-unknown-linux-musl/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "roundhouse-x86_64-unknown-linux-musl/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
