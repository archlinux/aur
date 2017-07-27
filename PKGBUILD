# Maintainer: M0Rf30

_pkgname=fabric-chaintool
pkgname=hyperledger-${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc="An utility to assist in various phases of Hyperledger Fabric chaincode development, such as compilation, test, packaging, and deployment"
arch=(x86_64)
url="https://github.com/hyperledger/fabric"
license=('APACHE')
groups=('hyperledger-fabric')
depends=('go' 'protobuf' 'java-environment')
makedepends=('leiningen')
source=("https://github.com/hyperledger/fabric-chaintool/archive/v$pkgver.tar.gz")

build() {
  cd $srcdir/${_pkgname}-$pkgver
  make
}

package() {
  cd $srcdir/${_pkgname}-$pkgver
  make PREFIX=$pkgdir/usr BINDIR=/bin install
}

md5sums=('fe3978e3dc30c8588ed8fcacea8e4606')
