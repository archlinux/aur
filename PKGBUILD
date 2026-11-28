# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slo-generator-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Set up service level objectives with Prometheus"
arch=('x86_64' 'aarch64')
url="https://github.com/globocom/slo-generator"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/slo-generator_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/slo-generator_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('5d45beb7bb7ca883859aa0407f9af19702da3f466dcdc3ff85373bc2032eec42')
sha256sums_aarch64=('0ea5663820c7a7e17c2b4ee93e824d9b5621b3cad09e7a6dd10f3e9dc1f67607')

package() {
  install -Dm755 "slo-generator" "${pkgdir}/usr/bin/slo-generator"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
