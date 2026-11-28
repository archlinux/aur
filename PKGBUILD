# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=anvil-zksync-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="In-memory ZKsync node for integration testing and debugging"
arch=('x86_64' 'aarch64')
url="https://github.com/matter-labs/anvil-zksync"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/matter-labs/anvil-zksync/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/anvil-zksync-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/anvil-zksync-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9')
sha256sums_x86_64=('5f8bb311d0a1da743ab5d9111a6230d5692e6f94f399c5c6fd918a42bb8b18ba')
sha256sums_aarch64=('9b95eda4a7b8c87ed545746fd169328cd4791e070a10d076a93b394ed5b7324e')

package() {
  install -Dm755 "anvil-zksync" "${pkgdir}/usr/bin/anvil-zksync"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
