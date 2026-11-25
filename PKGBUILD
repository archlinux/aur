# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=armada-bin
pkgver=0.22.19
pkgrel=1
pkgdesc="CLI for Armada, a multi-cluster batch queuing system for Kubernetes"
arch=('x86_64' 'aarch64')
url="https://github.com/armadaproject/armada"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/armadactl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/armadactl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('54360c7d2313816972915e285baff4a32627b6eed8d7cf5679e701bae51a560e')
sha256sums_aarch64=('9293257b5dd3f3338f262a8bab1efbe6a7660022b209d0a2ad9ba6a3f448f07c')

package() {
  install -Dm755 "armadactl" "${pkgdir}/usr/bin/armadactl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
