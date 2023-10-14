# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=cargo-wasi
pkgver=0.1.28
pkgrel=1

pkgdesc='A lightweight Cargo subcommand to build Rust code for the `wasm32-wasi` target'
url='https://bytecodealliance.github.io/cargo-wasi'
arch=('x86_64')
license=('APACHE')

depends=('rust')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f570fe05b3f16cbc0e5239fc7b26fb4cd402ea47c6e64404a405e1115417c7cb')

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
