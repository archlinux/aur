# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nebula-sync-bin
pkgver=0.11.3
pkgrel=1
pkgdesc="Synchronize configuration of multiple Pi-hole v6.x instances"
arch=('x86_64' 'aarch64')
url="https://github.com/lovelaze/nebula-sync"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nebula-sync_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nebula-sync_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('00da0bbf149e860b7262d133568214fc1809b1625d95ecd6f56eded9ed7aef84')
sha256sums_aarch64=('67b978edf4e98e663c3a288510fdfd6f575e38bed9686aa468c59e147aacb33a')

package() {
  install -Dm755 "nebula-sync" "${pkgdir}/usr/bin/nebula-sync"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
