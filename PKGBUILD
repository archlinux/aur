# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mmock-bin
pkgver=4.3.13
pkgrel=1
pkgdesc="HTTP mocking server for testing and prototyping"
arch=('x86_64' 'aarch64')
url="https://github.com/jmartin82/mmock"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mmock_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mmock_Linux_arm64.tar.gz")
sha256sums_x86_64=('3210a7694121744b234caec631debb3fa8848be2b6b697dfe8b5e5550d004bfe')
sha256sums_aarch64=('1be6ec6bba10aeeb979ea4130065244411888352989731f979ee46308d59fa5c')

package() {
  install -Dm755 "mmock" "${pkgdir}/usr/bin/mmock"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
