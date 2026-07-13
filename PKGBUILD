# Maintainer: Aleksey Vasilenko <aleksey.vasilenko@gmail.com>

pkgname=bmap-rs
pkgver=0.2.2
pkgrel=1
pkgdesc="Bmap implementation in Rust"
arch=('x86_64')
url="https://github.com/collabora/bmap-rs"
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc')
makedepends=('rust')
source=("$url/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha512sums=('614055240ee3b813e69166b35662a986931557e88093d39e8137b2b784152d7c4dba45a1dcfcd23bae943c6d5523c7b32511b73261448195c90b2c523ea2ae1e')

options=(!lto)

export CARGO_PROFILE_RELEASE_OPT_LEVEL=3

build() {
  cd "$pkgname-$pkgname-v$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgname-v$pkgver"

  install -vDm755 -t "$pkgdir/usr/bin" target/release/$pkgname
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-APACHE
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE-MIT
}
