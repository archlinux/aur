# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=logos-blockchain-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Logos blockchain node"
arch=('x86_64' 'aarch64')
url="https://github.com/logos-blockchain/logos-blockchain"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/logos-blockchain/logos-blockchain/${pkgver}/LICENSE-APACHE2.0")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/logos-blockchain-node-linux-x86_64-${pkgver}.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/logos-blockchain-node-linux-aarch64-${pkgver}.tar.gz")
sha256sums=('8f3c95de851c0acc9d1cbaa95e500e4198408283b853ed3e355ce27112057b44')
sha256sums_x86_64=('5e25d88aa230743f96c715bc94a4b8b8983f94181443ac80c9d7cf9c2cf9317e')
sha256sums_aarch64=('d7130028017769fbc175edba713c73554dd472e2a1c01257f6f547d59b5a2672')

package() {
  install -Dm755 "logos-blockchain-node" "${pkgdir}/usr/bin/logos-blockchain-node"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
