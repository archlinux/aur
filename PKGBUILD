# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentic-orchestrator-bin
pkgver=0.162.0
pkgrel=1
pkgdesc="Turn a goal into a supervised AI agent run"
arch=('x86_64' 'aarch64')
url="https://github.com/doordash-oss/agentic-orchestrator"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agentic-orchestrator_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agentic-orchestrator_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ac6cf983d3471d6478154058e8cd15eca829e3468214aa24d363a142d9b6478c')
sha256sums_aarch64=('5364c1a51e7c35ac2d7094b1de7fa7737406acc48012eee08cf7850b29836364')

package() {
  install -Dm755 "agentico" "${pkgdir}/usr/bin/agentico"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
