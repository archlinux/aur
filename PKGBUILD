# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=looker-cli-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Command-line tool for Looker content management"
arch=('x86_64' 'aarch64')
url="https://github.com/looker-open-source/looker-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/looker-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/looker-cli_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9b9f332f0039890d8837d38fa1f39cc34717e92c42da69f9d9d9f600726d9d9d')
sha256sums_aarch64=('4e34fae5bbc03d24d376e72c30557ea185121066bac82645a7c01561acfdbcd2')

package() {
  install -Dm755 "looker-cli" "${pkgdir}/usr/bin/looker-cli"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
