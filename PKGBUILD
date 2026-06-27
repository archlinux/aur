pkgname=hyperledger-fabric-bin
pkgver=3.1.5
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
sha256sums=('b9c31fd490991e76f8acb1835dee09fc19fee5428cb13e190ee6e0bdd2c37858')

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
