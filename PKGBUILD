# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=netsgo-bin
pkgver=0.1.19
pkgrel=1
pkgdesc="Self-hosted tunneling and node management platform"
arch=('x86_64' 'aarch64')
url="https://github.com/zsio/netsgo"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/netsgo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/netsgo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('f2c958531c8cb3a1820fc1cf5747df596283b42c3cf4a7a8c4fbb7002f93e36c')
sha256sums_aarch64=('e1dbb43f0f9f6d35bdc157fe7ba317f7f44e57088669b2828440aff874ed640f')

package() {
  install -Dm755 "netsgo" "${pkgdir}/usr/bin/netsgo"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
