# Maintainer: Ben Oliver <ben@bfoliver.com.com>

pkgname=stork
pkgver=1.4.0
pkgrel=1
pkgdesc="Impossibly fast web search, made for static sites."
arch=('x86_64')
url="https://github.com/jameslittle230/stork"
license=('Apache')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('28b072e43f0e551acbf8570abb035a74')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
