# Maintainer: Ben Oliver <ben@bfoliver.com.com>

pkgname=stork
pkgver=1.4.2
pkgrel=1
pkgdesc="Impossibly fast web search, made for static sites."
arch=('x86_64')
url="https://github.com/jameslittle230/stork"
license=('Apache')
depends=('gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('9c70eded6a304e93e11c22301c846652')

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
