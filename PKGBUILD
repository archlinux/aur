# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=smfs-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Filesystem for AI agents with retrieval, memory profiles and sync"
arch=('x86_64' 'aarch64')
url="https://github.com/supermemoryai/smfs"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/supermemoryai/smfs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/smfs-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/smfs-linux-arm64")
sha256sums=('a34709278d72c5b1e6915b0f76983252639f72bdf403e84298be4c31074bd79a')
sha256sums_x86_64=('a08c9561d1dfb3b4b2b02f3b8737cd29c3265b0d584ac243d3bdddfc21e1aad3')
sha256sums_aarch64=('5069649d1ede1aa0e3e6d66cf150a0660c8bed36454b76d4201ad2ee9444cdaf')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/smfs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
