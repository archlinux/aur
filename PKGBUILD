# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=a2a-cli-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Command-line interface for Agent2Agent (A2A) compatible agents"
arch=('x86_64' 'aarch64')
url="https://github.com/a2aproject/a2a-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/a2a_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/a2a_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2f2a3f93d477b2f84f72c6df798f8e226d360953fd28602426436e6acfc0cbfe')
sha256sums_aarch64=('22a2aee1aa4712688772eb0f42bf48bf3dc3c17ccc71f34a1e89c6e3841ea5bb')

package() {
  install -Dm755 "a2a" "${pkgdir}/usr/bin/a2a"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
