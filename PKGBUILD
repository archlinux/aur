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

sha256sums=('31b84f8a4c8418cf20c9952fdb50f0bce3e42d1eaaeac9beb78ab5af38f97273')
