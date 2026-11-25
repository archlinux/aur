# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=quil-bin
pkgver=1.101.2
pkgrel=1
pkgdesc="Terminal multiplexer that restores your workspace across reboots"
arch=('x86_64' 'aarch64')
url="https://github.com/artyomsv/quil"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/quil_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/quil_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('715c5d57e05d9168239ff2ffaa936c5a80a69881b3a78069b096aa393f5195e6')
sha256sums_aarch64=('7e851e9fb044eb7b961aec9750fbaa0cd42a3df5417a3f3aad704e0a30907df9')

package() {
  install -Dm755 "quil" "${pkgdir}/usr/bin/quil"
  install -Dm755 "quild" "${pkgdir}/usr/bin/quild"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
