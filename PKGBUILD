# Maintainer: robertfoster

_pkgname=fabric-chaintool
pkgname=hyperledger-${_pkgname}
pkgver=1.1.3
pkgrel=1
pkgdesc="An utility to assist in various phases of Hyperledger Fabric chaincode development, such as compilation, test, packaging, and deployment"
arch=(x86_64)
url="https://github.com/hyperledger/fabric-chaintool"
license=('APACHE')
groups=('hyperledger')
depends=('go' 'protobuf' 'jdk8-openjdk')
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

md5sums=('6cf951e8d089e21ca390670fc571fb5c')
