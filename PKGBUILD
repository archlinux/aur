pkgname=hyperledger-fabric-ca-bin
pkgver=1.5.16
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
sha256sums=('560fbb636072c6112c2b0eed2c8a5dbcdad19ead9c46f7ecc72a0f8c9135a9d5')

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
