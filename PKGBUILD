pkgname=hyperledger-fabric-ca-bin
pkgver=1.5.15
pkgrel=1
pkgdesc="Hyperledger Fabric CA binaries (fabric-ca-client and fabric-ca-server)"
arch=('x86_64')
url="https://www.hyperledger.org/use/fabric"
license=('Apache')
depends=('glibc')
provides=('hyperledger-fabric-ca')
conflicts=('hyperledger-fabric-ca')
options=('!strip')
source=("https://github.com/hyperledger/fabric-ca/releases/download/v${pkgver}/hyperledger-fabric-ca-linux-amd64-${pkgver}.tar.gz")
sha256sums=('a4831c233ab7c1d9e039dc5badf4cf890719358442b5042f12d94b1d6f919289')

package() {
  local _bins=(
    fabric-ca-client
    fabric-ca-server
  )

  install -d "${pkgdir}/usr/bin"
  for _bin in "${_bins[@]}"; do
    install -m755 "${srcdir}/bin/${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done
}
