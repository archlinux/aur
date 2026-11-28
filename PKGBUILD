# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=eth-faucet-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Ether faucet server"
arch=('x86_64' 'aarch64')
url="https://github.com/chainflag/eth-faucet"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/eth-faucet_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/eth-faucet_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('c8605c78779642fd222973e512591392e73889169514063fcc33c76e1e2805de')
sha256sums_aarch64=('a3bc8d186da38effab9021c7084182e4074164db8646e6b64e6bc1d51a58a8fb')

package() {
  install -Dm755 "eth-faucet" "${pkgdir}/usr/bin/eth-faucet"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
