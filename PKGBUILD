# Maintainer: horizonwiki <horizondebug@gmail.com>

pkgname=fire-cli
_pkgname=fire
pkgver=0.1.3
pkgrel=1
pkgdesc="Terminal fire animation written in Rust"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/horizonwiki/fire"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

sha256sums=("a98318a02f5137452f1ec491271b093efc5b07073d92219c5d3c29dffb865b20")

options=('!debug')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/fire-cli" "$pkgdir/usr/bin/fire-cli"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

