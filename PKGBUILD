# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wireblast-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="AF_XDP traffic generator"
arch=('x86_64' 'aarch64')
url="https://github.com/atoonk/wireblast"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wireblast_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wireblast_linux_arm64.tar.gz")
sha256sums_x86_64=('70b69065ca6af7c8aee8dfd9eebbf2eb1580fffcdd060242b981c8d38825e221')
sha256sums_aarch64=('287eaa9ea266f32f769817c9f65e755bb0dfe923938f2881dd8a4d3cac9a3c86')

package() {
  install -Dm755 "wireblast" "${pkgdir}/usr/bin/wireblast"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
