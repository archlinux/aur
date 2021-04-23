# Maintainer: FreddyMaster <blackcatshd@gmail.com>
pkgname=rust-clippy
pkgver=0.1.53
pkgrel=2
pkgdesc="A bunch of lints to catch common mistakes and improve your Rust code"
arch=('i686' 'x86_64')
url="https://github.com/rust-lang-nursery/rust-clippy"
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust-nightly' 'cargo-nightly' 'rustup')
build() {
  rustup run nightly cargo install clippy --root "$srcdir/build" --vers $pkgver --force
}
package() {
  mv "$srcdir/build" "$pkgdir/usr"
  rm -f "$pkgdir/usr/.crates.toml"
}
