# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gograph-bin
pkgver=1.7.26
pkgrel=1
pkgdesc="Go static analysis and call-graph CLI with an MCP server"
arch=('x86_64' 'aarch64')
url="https://github.com/ozgurcd/gograph"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gograph_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gograph_Linux_arm64.tar.gz")
sha256sums_x86_64=('a5503302bd8b5713b665b091a11fc9c926af2555457bf292fbbfa4bc316a57f5')
sha256sums_aarch64=('72b7ce1b6d579f2276fed3be954ce0fd72ea1276e34f4804cd8a82822281cfd1')

package() {
  install -Dm755 "gograph" "${pkgdir}/usr/bin/gograph"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
