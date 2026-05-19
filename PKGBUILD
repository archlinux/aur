pkgname=hyperledger-fabric-bin
pkgver=3.1.4
pkgrel=1
pkgdesc="Hyperledger Fabric precompiled binaries (configtxgen, configtxlator, cryptogen, discover, ledgerutil, orderer, osnadmin, peer)"
arch=('x86_64')
url="https://www.hyperledger.org/use/fabric"
license=('Apache')
depends=('glibc')
provides=('hyperledger-fabric')
conflicts=('hyperledger-fabric')
options=('!strip')
source=("https://github.com/hyperledger/fabric/releases/download/v${pkgver}/hyperledger-fabric-linux-amd64-${pkgver}.tar.gz")
sha256sums=('9c197263d3eba0f5a0b0f5ef14d64922131e5a0fd0f94b12b20fe9d1d96ed5ed')

package() {
  local _bins=(
    configtxgen
    configtxlator
    cryptogen
    discover
    ledgerutil
    orderer
    osnadmin
    peer
  )

  install -d "${pkgdir}/usr/bin"
  for _bin in "${_bins[@]}"; do
    install -m755 "${srcdir}/bin/${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done
}
