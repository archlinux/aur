# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=weclaw-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Connect AI agents to WeChat through ClawBot"
arch=('x86_64' 'aarch64')
url="https://github.com/fastclaw-ai/weclaw"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/fastclaw-ai/weclaw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/weclaw_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/weclaw_linux_arm64")
sha256sums=('c61044457c2e5aed94a4a1606ecaddd388aa67f0adfe29507c8ceb6f6f568dda')
sha256sums_x86_64=('dc1fa59bf4238eb89532f556b0896dc96f5493e039709d2c4b48b4b8b9b6c76a')
sha256sums_aarch64=('6efdd2e58c05def52f2af679828d20131ba8f108ccba82d3cecf047aa86fd170')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/weclaw"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
