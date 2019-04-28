# Maintainer: robertfoster

pkgname=libindy
pkgver=1.8.2
pkgrel=1
pkgdesc="Shared crypto library for Hyperledger Indy components"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-sdk"
license=('APACHE')
depends=('libsodium' 'openssl' 'sqlite3')
makedepends=('cmake' 'pkg-config' 'rust')
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
  install -d 755 $pkgdir/usr/include/indy/
  cp include/*.h $pkgdir/usr/include/indy/
}

md5sums=('83e64f0d31423cb7210f276857c68edb')
md5sums=('12259d9f1850a9be61093265cf53396d')
