# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=packetrusher-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="High-performance 5G UE/gNB simulator and load tester"
arch=('x86_64' 'aarch64')
url="https://github.com/HewlettPackard/PacketRusher"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/packetrusher-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/packetrusher-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('b3e39af69ea9263298e24c6885b0aeb8ad9d0d2389ffc794d04b71a77d1a7ecb')
sha256sums_aarch64=('8527f163a0dc0c55d7ac9f846532157735ac78c3ec21775fa66edca855d788bd')

package() {
  install -Dm755 "packetrusher" "${pkgdir}/usr/bin/packetrusher"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
