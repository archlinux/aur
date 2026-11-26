# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=flowctl-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Self-service workflow execution platform"
arch=('x86_64' 'aarch64')
url="https://github.com/cvhariharan/flowctl"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/flowctl_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/flowctl_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('5c7981964bfd6b6b3af89f8a52bdd6bb36988aaf4afc9677a842e6b2329d6e20')
sha256sums_aarch64=('27f70dadc02f1fcae7baa4c3c154ce8d3b6be6e6de43061c12dc8956676d4565')

package() {
  install -Dm755 "flowctl" "${pkgdir}/usr/bin/flowctl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
