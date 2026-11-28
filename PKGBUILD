# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lane-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Copy-on-write worktrees with persistent memory"
arch=('x86_64' 'aarch64')
url="https://github.com/lukeed/lane"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lukeed/lane/v${pkgver}/license")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lane-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lane-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('9a9edad7baae52622bddf3c15b2ef8a33d2c89f2d25408ad13e8a7481c6b0c97')
sha256sums_x86_64=('e76743055cf395a5e5b02d95d896a0504a27c69e0f703d922878860ec3de9cd4')
sha256sums_aarch64=('8566ceef59495957eaa0129970b6aa6e1d88804f8044d54730a8a85ff5ea2658')

package() {
  install -Dm755 "lane" "${pkgdir}/usr/bin/lane"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
