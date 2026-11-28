# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=busbar-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="Execution control plane for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/GetBusbar/busbar"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/GetBusbar/busbar/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/busbar-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/busbar-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('64f0eda182c803ebff691d91e71a2dae468d759d73d646b13a0b1b1df06ddd9d')
sha256sums_aarch64=('6f8ab606b81ea8326813a991729fefe237d607c89bbcc433c1d5000a8257c8ac')

package() {
  install -Dm755 "busbar" "${pkgdir}/usr/bin/busbar"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
