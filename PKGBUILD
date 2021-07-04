# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet
pkgver=2.3.3
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=($CARCH)
url='https://github.com/niklasf/fishnet'
license=(GPL)
makedepends=(rust)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6b5057e9b133fcbeb9d7df852811c581532b3f400b8e9bba8f73f9b93000eca3')

build() {
  cd $pkgname-$pkgver
  cargo build --release -vv --
}

package() {
  install -Dm755 $pkgname-$pkgver/target/release/fishnet -t "$pkgdir/usr/bin/"
}
