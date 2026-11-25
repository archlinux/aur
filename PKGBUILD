# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trueblocks-core-bin
pkgver=5.9.3
pkgrel=1
pkgdesc="Local-first indexing and querying of Ethereum data"
arch=('x86_64' 'aarch64')
url="https://github.com/TrueBlocks/trueblocks-core"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/trueblocks-core_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/trueblocks-core_linux_arm64.tar.gz")
sha256sums_x86_64=('918095ab0beb0658986c7bdb18fef167cbd2cec4739834e9a265d03faf8a42bc')
sha256sums_aarch64=('75dc6911c60a29aa9f73e62ac0f150cf7e326a408f3914c6e1b02ecc25cce910')

package() {
  install -Dm755 "trueblocks-core" "${pkgdir}/usr/bin/trueblocks-core"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
