pkgname=hyperledger-fabric-bin
pkgver=3.1.3
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
sha256sums=('b823d48017fece94d1de5fa1d886041a629684fe86a7fa19525c56ef3002ab03')

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
