# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubara-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="A CLI and package manager for building, distributing, and bootstrapping multi-cluster Kubernetes platforms via pure GitOps"
arch=('x86_64' 'aarch64')
url="https://github.com/kubara-io/kubara"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kubara-io/kubara/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubara_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubara_${pkgver}_linux_arm64.tar.gz")
sha256sums=('43fcb4fe343b3d149979293fb1fae589a8511846f4929fc21b9ec62b0e639291')
sha256sums_x86_64=('21c5881356caa985af7ec7374e0ab931429a8b3d5112b3ce9b60313d90138ba7')
sha256sums_aarch64=('bb5a7e56a396355e45c441096546dc662f980c0e5026b3d9709118a24367ca08')

package() {
  install -Dm755 "kubara" "${pkgdir}/usr/bin/kubara"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
