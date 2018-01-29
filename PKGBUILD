# Maintainer: robertfoster

pkgname=libindy-crypto
pkgver=0.1.6
pkgrel=1
pkgdesc="Shared crypto library for Hyperledger Indy components"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-crypto"
license=('APACHE')
depends=('libsodium')
makedepends=('rust')
source=("https://github.com/hyperledger/indy-crypto/archive/master.zip")

build() {
  cd $srcdir/indy-crypto-master
  cd $pkgname
  cargo build --release
}

package() {
  cd $srcdir/indy-crypto-master
  cd $pkgname
  install -Dm755 target/release/libindy_crypto.so "$pkgdir/usr/lib/libindy_crypto.so"
  install -d 755 $pkgdir/usr/include/indy_crypto/
  cp include/*.h $pkgdir/usr/include/indy_crypto
}

md5sums=('SKIP')
