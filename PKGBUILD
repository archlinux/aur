# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pipelock-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="Firewall for AI agents covering MCP security and network egress"
arch=('x86_64' 'aarch64')
url="https://github.com/pipelab-org/pipelock"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pipelock_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pipelock_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3b6a9a6aa1185f80f3e32c393e4c47e0efe32356ec0746aec5050eeed4af9d6e')
sha256sums_aarch64=('5b49d2e47e9ab3a13b7ad86b2562aa0c9229829634c8974f3a0683ee5b189978')

package() {
  install -Dm755 "pipelock" "${pkgdir}/usr/bin/pipelock"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
