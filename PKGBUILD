# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=olla-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight proxy and load balancer for LLM infrastructure"
arch=('x86_64' 'aarch64')
url="https://github.com/thushan/olla"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/olla_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/olla_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('84530cd7192333448e4472061afc4fd3b0c8ae36ad5d9a55898ec5cd838b94e6')
sha256sums_aarch64=('d48f77661666177fcf16f11737cacf4ce836a07042662272ede6e903729f84ee')

package() {
  install -Dm755 "olla" "${pkgdir}/usr/bin/olla"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "examples/ollama-openwebui/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
