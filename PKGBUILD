# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=cargo-wasi
pkgver=0.1.26
pkgrel=1

pkgdesc='A lightweight Cargo subcommand to build Rust code for the `wasm32-wasi` target'
url='https://bytecodealliance.github.io/cargo-wasi'
arch=('x86_64')
license=('APACHE')

depends=('rust')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c90471ec6cc93758b4960a888479ee629a532772678469b6421c889facfac2bf')

build() {
  cd $pkgname-$pkgver

  cargo build --release
}

package() {
  cd $pkgname-$pkgver

  cargo install --root "$pkgdir"/usr --path .

  rm "$pkgdir"/usr/.crates.toml
  rm "$pkgdir"/usr/.crates2.json
}

# vim:set ts=2 sw=2 et:
