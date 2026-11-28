# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cydonia-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="Control panel for Claude Code, Codex, OpenCode and other AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/crabtalk/cydonia"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/crabtalk/cydonia/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/cydonia-linux-x86_64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/cydonia-linux-aarch64.tar.xz")
sha256sums=('d7e627b4c0f82a7b4f23992446abbd7b84347b9d7abec321e01e26715d41ebf1')
sha256sums_x86_64=('7df780e3fad51df6e88d88f0bfda9b863e3b419a89acf065958027bc88efc84c')
sha256sums_aarch64=('645a353e72ab4c700039d294ef759bbe5198a40cc184fa9582bfbd7f9523f9ae')

package() {
  install -Dm755 "cydonia.app/bin/cydonia" "${pkgdir}/usr/bin/cydonia"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
