pkgname=hyperledger-fabric-ca-bin
pkgver=1.5.20
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
sha256sums=('922dc753fec9d5b0dddf83b1e31b3280f011c8eb614f04e99c944ec09d1bc873')

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
