# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=iron-proxy-bin
pkgver=0.61.0
pkgrel=1
pkgdesc="Egress firewall for untrusted workloads"
arch=('x86_64' 'aarch64')
url="https://github.com/paradigmxyz/iron-proxy"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/iron-proxy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/iron-proxy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('30820ba357b19a41ca6eda77caf7c7105cbd0444343d804711c57b8ae7a3c6a9')
sha256sums_aarch64=('824441e4982f2ddbd14afa26dfb72a3e61259ab277cdab586e24e1ecd54cca52')

package() {
  install -Dm755 "iron-proxy" "${pkgdir}/usr/bin/iron-proxy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
