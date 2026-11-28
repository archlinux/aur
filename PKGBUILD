# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=faucet-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="Turn any SQL database into a governed REST API with MCP support"
arch=('x86_64' 'aarch64')
url="https://github.com/faucetdb/faucet"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/faucet_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/faucet_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('bb59d96ae3bbd9d8684a84c54fdd5cb4732a1efc905d92f756a3747449d89065')
sha256sums_aarch64=('8a4e76af796f63f030399847fa52e21c7af1c6775cb68f233bc2d22408a7f93e')

package() {
  install -Dm755 "faucet" "${pkgdir}/usr/bin/faucet"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
