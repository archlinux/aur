# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tusk-cli-bin
pkgver=0.2.16
pkgrel=1
pkgdesc="Automated testing with live traffic record and replay"
arch=('x86_64' 'aarch64')
url="https://github.com/Use-Tusk/tusk-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tusk-cli_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tusk-cli_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('abe222c1daf6d0c05f596febd9918cde65d7e9748e0b00608a1a95387992b123')
sha256sums_aarch64=('792b37ec1ce4dce39bcbffa7c14fa449ac546972778785c0aeeecb6175894d78')

package() {
  install -Dm755 "tusk" "${pkgdir}/usr/bin/tusk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
