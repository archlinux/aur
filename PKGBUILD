# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=cargo-wasi
pkgver=0.1.27
pkgrel=1

pkgdesc='A lightweight Cargo subcommand to build Rust code for the `wasm32-wasi` target'
url='https://bytecodealliance.github.io/cargo-wasi'
arch=('x86_64')
license=('APACHE')

depends=('rust')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bytecodealliance/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('74d75147a663eeb7466ef6b862d4f672ea9359ed6ca96c8fefe4d5cf0438bb4a')

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
