# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-vm-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Run AI agents in safe VMs scoped to a local folder"
arch=('x86_64' 'aarch64')
url="https://github.com/sylvinus/agent-vm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agent-vm-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agent-vm-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('a20e5d7cf5989fd7ad4559159e09fb55ada4a7fab8564b0334ecca4ed9110d3b')
sha256sums_aarch64=('c032a705941c77055ef01f5eefaf083f89343d31ea5f166919a338f2ddf40c94')

package() {
  install -Dm755 "agent-vm-${pkgver}/agent-vm" "${pkgdir}/usr/bin/agent-vm"
  install -Dm644 "agent-vm-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "agent-vm-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
