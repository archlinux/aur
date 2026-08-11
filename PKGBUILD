pkgname=hyperledger-fabric-ca-bin
pkgver=1.5.22
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
sha256sums=('7f52ab98481ac0e4bfcf5b5aabfb403fa692ee100ae3b2ca3bf3f2152851573d')

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
