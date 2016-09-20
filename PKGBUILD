# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=rustfmt
pkgver=0.6.2
pkgrel=2
pkgdesc="A tool for formatting Rust code according to style guidelines"
url="https://github.com/rust-lang-nursery/rustfmt"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache' 'MIT')
source=("https://github.com/rust-lang-nursery/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bfec27178ed7fcc2da27ac46604abb231626e3f0a8800d70128d0b9a152c22f7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT LICENSE-APACHE
  cd target/release
  install -Dm755 -t "$pkgdir/usr/bin/" rustfmt cargo-fmt
}
