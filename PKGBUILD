# Maintainer: robertfoster

pkgname=libindy
pkgver=1.3.0
pkgrel=1
pkgdesc="Shared crypto library for Hyperledger Indy components"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-crypto"
license=('APACHE')
depends=('')
makedepends=('rust')
source=("https://github.com/hyperledger/indy-sdk/archive/v$pkgver.tar.gz")

build() {
  cd $srcdir/indy-sdk-$pkgver
  cd libindy
  cargo build --release
}

package() {
  cd $srcdir/indy-sdk-$pkgver
  cd libindy
  install -Dm755 target/release/libindy.so "$pkgdir/usr/lib/libindy.so"
  cp -r include $pkgdir/usr/include
}

md5sums=('SKIP')
