# Maintainer: Afri 5chdn <aur@5chdn.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethminer
pkgver=0.12.0.dev2
pkgrel=1
pkgdesc="Ethereum miner with OpenCL, CUDA and stratum support."
arch=('x86_64')
depends=(
  'boost'
  'boost-libs'
  'jsoncpp'
  'libjson-rpc-cpp-git'
  'opencl-headers'
  'python2'
)
optdeps=(
  'cuda: NVIDEA GPU mining support.'
  'opencl-mesa: AMD/ATI GPU mining support.'
)
url="https://github.com/ethereum-mining/ethminer"
license=('MIT')
source=(
  "https://github.com/ethereum-mining/ethminer/releases/download/v${pkgver}/ethminer-${pkgver}-Linux.tar.gz"
)
sha256sums=(
  'e2b6f595c76075549ca59ba239d26b96d0bd6d886441c3fd16e0e0975777aed7'
)
provides=(
  'ethminer'
)
conflicts=(
  'ethereum'
  'ethminer-git'
  'ethereum-git'
)

package() {
  install -Dm755 -t "${pkgdir}"/usr/bin ${srcdir}/bin/ethminer
}
