# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=moai-adk-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="Spec-driven agentic development harness for Claude Code"
arch=('x86_64' 'aarch64')
url="https://github.com/modu-ai/moai-adk"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/moai-adk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/moai-adk_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('78dbae0da51c2966eaef7d952c20ed4c025d71a0e3ccb023df4e0d16bd78d82d')
sha256sums_aarch64=('8887d28cbcd11c4bd66938a319246f0cf4fa1877a08945c704a47ddfbefc429e')

package() {
  install -Dm755 "moai" "${pkgdir}/usr/bin/moai"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
