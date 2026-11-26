# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=minimock-bin
pkgver=3.4.7
pkgrel=1
pkgdesc="Mock generation tool for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/gojuno/minimock"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/minimock_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/minimock_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('682174067592a2c83f005c6416a9df3434e239250d4034ffffef4b08dfa35a7d')
sha256sums_aarch64=('8707f0f10a618fa920a2214ebc3a594d4542ffc2e1671ceb5625a16fa1749a89')

package() {
  install -Dm755 "minimock" "${pkgdir}/usr/bin/minimock"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
