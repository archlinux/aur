# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=witnet-rust-bin
pkgver=2.0.27
pkgrel=1
pkgdesc="Witnet decentralized oracle node and wallet backend"
arch=('x86_64' 'aarch64')
url="https://github.com/witnet/witnet-rust"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/witnet/witnet-rust/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/witnet-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/witnet-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha256sums_x86_64=('9a79406e5c8bf637a20e92cdbd668f848434b074aac101ca079ada0db67860fd')
sha256sums_aarch64=('f0ab3d6df795bc0ba3b4b910935ff5477daac928a3cfe6556a18ca9825ef9bee')

package() {
  install -Dm755 "./witnet" "${pkgdir}/usr/bin/witnet"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
