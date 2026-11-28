# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=holos-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Docker Compose-like tool for KVM/QEMU virtual machines"
arch=('x86_64' 'aarch64')
url="https://github.com/zeroecco/holos"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/holos_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/holos_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('dc5c53f752f9ff52ccc6855f22af39d3e60a321936e99caf7d60b6f4eae1c7c7')
sha256sums_aarch64=('a84a758dd0328e33e3ac404039efe898268b08e45fbbf343e8eaf16477796adf')

package() {
  install -Dm755 "holos" "${pkgdir}/usr/bin/holos"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
