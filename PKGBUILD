# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=grpc-health-probe-bin
pkgver=0.4.63
pkgrel=1
pkgdesc="Command-line tool to health-check gRPC applications"
arch=('x86_64' 'aarch64')
url="https://github.com/grpc-ecosystem/grpc-health-probe"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/grpc-ecosystem/grpc-health-probe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/grpc_health_probe-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/grpc_health_probe-linux-arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('d5edc8957224e986350751dee39ea408d9333a31337bce2e4f1678f41d950fe6')
sha256sums_aarch64=('5f7a2b6fecc33fedbfde1b37eff0420ae9163fdac55cce79f1e363ff79c22af3')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/grpc_health_probe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
