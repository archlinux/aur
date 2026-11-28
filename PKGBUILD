# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-node_resource-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="kubectl plugin to query node allocations and utilization"
arch=('x86_64' 'aarch64')
url="https://github.com/ahmetb/kubectl-node_resource"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-node_resource_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubectl-node_resource_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e048cfc196c950933e70c72df6d264c73fcf455defc3fa822ea9c9ff32aa2393')
sha256sums_aarch64=('0691a594bc371bc15a0388150e0200a17b1324ed07ff69da2560b6ce317112fd')

package() {
  install -Dm755 "kubectl-node_resource" "${pkgdir}/usr/bin/kubectl-node_resource"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
