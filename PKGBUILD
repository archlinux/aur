# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=riscvsim-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="RISC-V simulator for learning computer engineering"
arch=('x86_64' 'aarch64')
url="https://github.com/rawcache/riscvsim"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rawcache/riscvsim/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/riscvsim-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/riscvsim-linux-arm64.tar.gz")
sha256sums=('28d3d7d2b98a2510aa8c35b87b96f7c619d8cba58e9c2100a3476a256d6d63c8')
sha256sums_x86_64=('c13ea3e74594baadc4980ada8a09e1345f3942617413405b5d4a36fc2ef51314')
sha256sums_aarch64=('1ed5ef875d69696f79e78a201c2417a6983241dd1cdb3ec8d252c3f3cd20fffd')

package() {
  install -Dm755 "riscvsim" "${pkgdir}/usr/bin/riscvsim"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
