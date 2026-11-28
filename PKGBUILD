# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=who-dat-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Domain lookup API using RDAP and WHOIS"
arch=('x86_64' 'aarch64')
url="https://github.com/lissy93/who-dat"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/who-dat-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/who-dat-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('6a89ccb9ebbfefa19b3b9bc4531ceb9ee47111ef62240a8ca0248589cbc432b7')
sha256sums_aarch64=('eca8b40b705bca730e3f84ada9b60ef1d6c4f1c02c359cb2c12a6b0d441407fa')

package() {
  install -Dm755 "who-dat" "${pkgdir}/usr/bin/who-dat"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
