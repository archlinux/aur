# Maintainer: Zola Gonano <zolagonano@protonmail.com>

pkgname=bhsh
pkgver=0.1.0
pkgrel=1
pkgdesc="A Unix-like blackhole shell"
arch=('x86_64')
url="https://github.com/zolagonano/bhsh"
license=('MIT')
depends=('rust')
makedepends=('git' 'base-devel')

source=("git+https://github.com/zolagonano/bhsh.git#tag=$pkgver")
sha256sums=("SKIP")

build() {
  cd "$srcdir/bhsh"

  cargo build --release --locked
}

package() {
  cd "$srcdir/bhsh"
  
  strip "target/release/bhsh"
  install -Dm755 "target/release/bhsh" "$pkgdir/usr/bin/bhsh"
}

