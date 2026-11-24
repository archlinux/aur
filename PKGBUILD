# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cc9s-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="k9s-style TUI for managing Claude Code sessions"
arch=('x86_64' 'aarch64')
url="https://github.com/kincoy/cc9s"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/kincoy/cc9s/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/cc9s-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/cc9s-linux-arm64")
sha256sums=('8ae7706dd36b7573fe4d3be70521d15960d19d246c314054526fe6d3cae8fda0')
sha256sums_x86_64=('05932d4cf9dc25d958c81172a8098967e3605f1c83515fc139c959df0f38c71e')
sha256sums_aarch64=('8c65dd6758ff739f4ceb5910d0dc85c8bc53f4df905bc2759e327486db5983ea')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cc9s"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
