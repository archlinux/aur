# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet
pkgver=2.3.3
pkgrel=2
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=($CARCH)
url='https://github.com/niklasf/fishnet'
license=(GPL)
makedepends=(git rust)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare(){
  cd $pkgname
  git submodule update --init
}

build() {
  cd $pkgname
  cargo build --release -vv --
}

package() {
  install -Dm755 $pkgname/target/release/fishnet -t "$pkgdir/usr/bin/"
}
