# Maintainer: %s <%s>
pkgname=spl-token  
pkgver=0.1.3
pkgrel=2
pkgdesc="A token program on the Solana blockchain, usable for fungible and non-fungible tokens"
url="https://github.com/solana-labs/solana-program-library"
arch=('i686' 'x86_64')
license=('Apache')
depends=()
makedepends=("rustup")
provides=("spl-token")
source=("$pkgname-$pkgver.tar.gz::https://github.com/solana-labs/solana-program-library/archive/refs/tags/@solana/$pkgname@v$pkgver.tar.gz")
md5sums=('a04a251d13e50e68bb31fe8e4c07fce2')

prepare() {
  rustup update stable
}

build() {
  cd "solana-program-library--solana-$pkgname-v$pkgver"
  cargo build --release --bin spl-token
}
package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/solana-program-library--solana-$pkgname-v$pkgver/target/release/$pkgname $pkgdir/usr/bin
}
