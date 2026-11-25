# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=toxiproxy-bin
pkgver=2.13.0
pkgrel=1
pkgdesc="alarm_clock: :fire: A TCP proxy to simulate network and system conditions for chaos and resiliency testing"
arch=('x86_64' 'aarch64')
url="https://github.com/Shopify/toxiproxy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/toxiproxy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/toxiproxy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('08fd7b3d677bd11358d16a5ce8fd9e1a08f69aa24984bc16781c84200d6b3b4d')
sha256sums_aarch64=('57f19b56ce146aa4e65e5363e42d8fd61bd01f586f710b9b4f75dbf27eeb99f0')

package() {
  install -Dm755 "toxiproxy-server" "${pkgdir}/usr/bin/toxiproxy-server"
  install -Dm755 "toxiproxy-cli" "${pkgdir}/usr/bin/toxiproxy-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
