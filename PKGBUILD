# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=llmcc-bin
pkgver=0.2.65
pkgrel=1
pkgdesc="Multi-depth architecture views of code for understanding and generation"
arch=('x86_64' 'aarch64')
url="https://github.com/allenanswerzq/llmcc"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/allenanswerzq/llmcc/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/llmcc-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/llmcc-linux-arm64")
sha256sums=('d17f227e4df5da1600391338865ce0f3055211760a36688f816941d58232d8dc')
sha256sums_x86_64=('063e8e3d8414f6b4f73c8953cefffbef5f80eb109a6565d39d838f6c68430e01')
sha256sums_aarch64=('02a2d57c5d33d45cc2d66fcd3536a3577019d3d821886c588c12aa4a58596680')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/llmcc"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
