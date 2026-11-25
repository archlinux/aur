# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zerostack-bin
pkgver=1.8.6
pkgrel=1
pkgdesc="Lightweight coding agent written in Rust, optimized for memory footprint and performance"
arch=('x86_64')
url="https://github.com/gi-dellav/zerostack"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/gi-dellav/zerostack/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zerostack-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('a265628533a6d26ae89b723636a58d8e41b0e8dc41039048ea34482dba497e90')

package() {
  install -Dm755 "zerostack" "${pkgdir}/usr/bin/zerostack"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
