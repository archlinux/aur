# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=karmada-bin
pkgver=1.19.1
pkgrel=1
pkgdesc="Open, Multi-Cloud, Multi-Cluster Kubernetes Orchestration"
arch=('x86_64' 'aarch64')
url="https://github.com/karmada-io/karmada"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/karmadactl-linux-amd64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/karmadactl-linux-arm64.tgz")
sha256sums_x86_64=('718df9bc8be26f071dc0420fe8a26f22bf1259b69470abe87e44b964e9aeea4e')
sha256sums_aarch64=('698fa16df83d32606defd8a7c5f3a2eb94dc0bdfd5c3a793415b58c0bae62190')

package() {
  install -Dm755 "karmadactl" "${pkgdir}/usr/bin/karmadactl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
