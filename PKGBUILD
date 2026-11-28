# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=yolorouter-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Self-hosted OpenAI-compatible LLM gateway with multi-provider failover"
arch=('x86_64' 'aarch64')
url="https://github.com/yolorouter/yolorouter"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/yolorouter_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/yolorouter_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('b2db07d7c9cc9e83cedab01cf30766a4911e4f116209a221340ba15105a198e9')
sha256sums_aarch64=('89ff9024a1daefe99de345783249b70df16e497870ce492091cd8a29ee0096f1')

package() {
  install -Dm755 "yolorouter" "${pkgdir}/usr/bin/yolorouter"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
