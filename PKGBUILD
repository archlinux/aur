# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agentsmith-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Model-agnostic operating harness for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/PromptPartner/agentsmith"
license=('MIT')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/PromptPartner/agentsmith/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/agentsmith-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/agentsmith-linux-arm64.tar.gz")
sha256sums=('36f2a62d8e883159fb6743cd04db4a40728d91640c2398a2782eec5d8f7dd3b7')
sha256sums_x86_64=('5189929aeb83787eda4b375f322e7188db1c182efc0f70152481bc427d29bacd')
sha256sums_aarch64=('ba772630693fd5aa6d9c40077c5e1337b1891df48f52429d2d33bc1d4b9431f1')

package() {
  install -Dm755 "agentsmith" "${pkgdir}/usr/bin/agentsmith"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
