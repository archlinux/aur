# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=runn-bin
pkgver=1.11.2
pkgrel=1
pkgdesc="Run API and browser operations following a scenario"
arch=('x86_64' 'aarch64')
url="https://github.com/k1LoW/runn"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/runn_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/runn_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4e6cedd536511a40e1fcb51895a23ab814a7173fc3cd909aeff9cb7fd8dc22e0')
sha256sums_aarch64=('b914afbf9dd7f3658d05bf90d4411ed24c7c84ccd599340031e09a47a41e3b29')

package() {
  install -Dm755 "runn" "${pkgdir}/usr/bin/runn"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
