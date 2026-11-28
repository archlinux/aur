# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=armada-bin
pkgver=0.22.20
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
sha256sums_x86_64=('9d35b9d610894ef48802875e8d04038b1185942e70ccb7d2ba4776493100bb56')
sha256sums_aarch64=('acf4114900123695cc9147c64e287e08998e04b86269bfcf403dc13aa3deef77')

package() {
  install -Dm755 "armadactl" "${pkgdir}/usr/bin/armadactl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
