# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chaos-rpg-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A roguelike where every hit, heal and loot drop is decided by chaining real math"
arch=('x86_64')
url="https://github.com/Mattbusel/chaos-rpg"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chaos-rpg-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('332098c07739b624e062eedf5b6a0e097927d692b97fa3d82583431968a56789')

package() {
  cd "chaos-rpg-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "chaos-rpg" "${pkgdir}/usr/bin/chaos-rpg"
  install -Dm755 "chaos-rpg-proof" "${pkgdir}/usr/bin/chaos-rpg-proof"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
