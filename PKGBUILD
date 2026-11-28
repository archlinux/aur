# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kubectl-pods_on-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="kubectl plugin to query Pods by node names or selectors"
arch=('x86_64' 'aarch64')
url="https://github.com/ahmetb/kubectl-pods_on"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kubectl-pods_on_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kubectl-pods_on_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e68b30e124a50669aaff4e644bb0667aae93a422e40fd9d51387441130c1e140')
sha256sums_aarch64=('a17a316fd279ff458d8f0abb189fcd6b75d540cafa002487059ee1d060522e3c')

package() {
  install -Dm755 "kubectl-pods_on" "${pkgdir}/usr/bin/kubectl-pods_on"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
