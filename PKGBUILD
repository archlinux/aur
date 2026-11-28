# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rdmatop-bin
pkgver=0.1.33
pkgrel=1
pkgdesc="htop-like TUI for real-time RDMA network monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/uccl-project/rdmatop"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/uccl-project/rdmatop/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rdmatop-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rdmatop-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('71c45f296e293a540b97b151e1f17d1799e6637eb7c0a27eafb3fd03eb9934d3')
sha256sums_x86_64=('0d44aa437d7ee0d8fa10ee1288b6d5bbd42970afdd2c37a53c5f6cb99f53a998')
sha256sums_aarch64=('2d895b82bdd009aedab751c614b21f5500d842cbf280c526a9168cf6e2c0c8d7')

package() {
  install -Dm755 "rdmatop" "${pkgdir}/usr/bin/rdmatop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
