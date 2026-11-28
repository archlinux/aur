# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=net-merge-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Use all your internet connections at once on Windows, macOS, Linux and Android: per-connection load balancing over Wi-Fi, Ethernet, mobile data and phone tethers"
arch=('x86_64' 'aarch64')
url="https://github.com/net-merge/net-merge"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/net-merge-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/net-merge-linux-aarch64.tar.gz")
sha256sums_x86_64=('6db7aa15d85a7ee7fb4eb26d55f6e19a22c61843cd31f18770736291016bd162')
sha256sums_aarch64=('46ae8775a192fcab046e540e18050b7976a05c3fb4834d1d5cbd7bd875af6fd2')

package() {
  install -Dm755 "net-merge" "${pkgdir}/usr/bin/net-merge"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
