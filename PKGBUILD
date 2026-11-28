# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clusteradm-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Bootstrap and manage the Open Cluster Management control plane"
arch=('x86_64' 'aarch64')
url="https://github.com/open-cluster-management-io/clusteradm"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clusteradm_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clusteradm_linux_arm64.tar.gz")
sha256sums_x86_64=('aa94241caf353a515a0778e0ce608b4c68ced9b3e7f6fb5fe23f48393926153b')
sha256sums_aarch64=('37fa11ea802f526ed3226af892b4066f9e8224ac9d620849f6cdc1ecd074560b')

package() {
  install -Dm755 "clusteradm" "${pkgdir}/usr/bin/clusteradm"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
