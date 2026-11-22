# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=streamtop-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A terminal monitor for live video streams with real-time health checks"
arch=('x86_64' 'aarch64')
url="https://github.com/Jorji49/streamtop"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Jorji49/streamtop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/streamtop-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/streamtop-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('17ae2f4382f88ddcc4dafa488d59401dbb0d3a59d7f1a967c715cd13fbfa9f3d')
sha256sums_x86_64=('4cf390ca11bdff5aa69d0f5e83a3951abd21a91776ecbeec26e889b109e1477e')
sha256sums_aarch64=('e49c3a2ed7d07ad8c0892d329144488b056240c38ee2a566b6f72731c0d42fa2')

package() {
  install -Dm755 "streamtop" "${pkgdir}/usr/bin/streamtop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
