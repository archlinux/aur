# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=quil-bin
pkgver=1.101.1
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
sha256sums_x86_64=('459d8f98d1d53ddfc5aa6f63058af0b66c6d635e6798702125da0839d885e505')
sha256sums_aarch64=('23aecbd2ba74a56ed261b88b218b4a8f4533e8be8cacb3f770aafebf0480ef62')

package() {
  install -Dm755 "quil" "${pkgdir}/usr/bin/quil"
  install -Dm755 "quild" "${pkgdir}/usr/bin/quild"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
