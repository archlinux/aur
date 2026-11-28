# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=llm-gateway-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Zero-trust LLM gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/openziti/llm-gateway"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/llm-gateway_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/llm-gateway_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('436fe38205ac5c8027b939abe6458db93e21a7dcd29038ecf2d14a1ca3489ca8')
sha256sums_aarch64=('f0af901b7a3328c07de5858bfa570faffd27d77b09cc27308979f42c158668bd')

package() {
  install -Dm755 "llm-gateway" "${pkgdir}/usr/bin/llm-gateway"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
