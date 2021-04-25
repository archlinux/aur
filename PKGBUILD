# Maintainer: Michael Nussbaum <michaelnussbaum08@gmail.com>
pkgname="mozlz4"
pkgdesc="Decompress / compress mozlz4 files"
pkgver=0.1.0
pkgrel=1
arch=("x86_64")
url="https://github.com/jusw85/mozlz4"
license=("MIT")
makedepends=("git" "rust" "cargo")
source=("git+https://github.com/jusw85/mozlz4.git#tag=v${pkgver}")
sha256sums=("SKIP")

prepapre() {
  cd "$pkgname"
}

build(){
  cd "$pkgname"
  env CARGO_INCREMENTAL=0 cargo build --release --locked
}

check(){
  cd "$pkgname"
  env CARGO_INCREMENTAL=0 cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -D -m755 "target/release/mozlz4" "$pkgdir/usr/bin/mozlz4"
}
