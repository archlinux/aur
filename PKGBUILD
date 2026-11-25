# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-code-harness-bin
pkgver=5.16.0
pkgrel=1
pkgdesc="Claude Code Dedicated Development Harness - Achieving High-Quality Development Through an Autonomous PlanWorkReview Cycle"
arch=('x86_64')
url="https://github.com/Chachamaru127/claude-code-harness"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Chachamaru127/claude-code-harness/v${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/harness-linux-amd64")
sha256sums=('05678f1f3878cfafee6fba047bd6ea5877df4a66c6d420c9f0225b6709edfda3')
sha256sums_x86_64=('b1bc5bcb5e7f5ef3fab9fd237d11a9ee9e9414f9f4760f4282bda44f5e7d9b53')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/harness"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
