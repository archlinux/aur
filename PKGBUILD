# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clickvisual-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Lightweight log analytics and data visualization platform built on ClickHouse"
arch=('x86_64' 'aarch64')
url="https://github.com/clickvisual/clickvisual"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/clickvisual-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/clickvisual-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('97939eb37aa5a7a2f25a1886e98ebcd733657a872c7c7bac4555129ab16c5711')
sha256sums_aarch64=('614cd6d5c540b510ae7859512e5d083c3664f027dce213950511ea67b76008e5')

package() {
  install -Dm755 "clickvisual" "${pkgdir}/usr/bin/clickvisual"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
