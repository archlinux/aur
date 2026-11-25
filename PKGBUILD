# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sockudo-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Fast Pusher-compatible WebSocket server"
arch=('x86_64' 'aarch64')
url="https://github.com/sockudo/sockudo"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/sockudo/sockudo/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/sockudo-v${pkgver}-x86_64-unknown-linux-gnu.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/sockudo-v${pkgver}-aarch64-unknown-linux-gnu.tgz")
sha256sums=('45fbb4f517d9620757e1dbd9c3398556ddb07c5607f3b0ca86f472f3ce83f0eb')
sha256sums_x86_64=('b52cbdca5eb60a38847ee56eb85eb6e7098c90f8af01a400a05d511cb31a0573')
sha256sums_aarch64=('0d45719e46c6756cd54726c1b5c1ae3aaf1398500111bf149c3338e8e78e7639')

package() {
  install -Dm755 "sockudo" "${pkgdir}/usr/bin/sockudo"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
