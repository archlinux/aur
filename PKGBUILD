# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-rust-app
pkgver=0.4.2
pkgrel=1
pkgdesc="Rust-native scaffolding CLI for the Rust programming language (source build)"
arch=('x86_64' 'aarch64')
url="https://github.com/Create-Rust-App/create-rust-app"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
provides=('create-rust-app' 'create-awesome-rust-app')
conflicts=('create-awesome-rust-app-bin' 'create-rust-app')
source=("create-awesome-rust-app-${pkgver}.tar.gz::https://github.com/Create-Rust-App/create-rust-app/archive/refs/tags/create-rust-app@${pkgver}.tar.gz")
sha256sums=('41a85c188b7323c7d368dbb5fad38fe87a3de5a3bd06be20ece268b90376e10e')

build() {
  cd "create-rust-app-create-rust-app-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "create-rust-app-create-rust-app-${pkgver}"
  install -Dm755 target/release/create-rust-app "$pkgdir/usr/bin/create-rust-app"
  ln -s create-rust-app "$pkgdir/usr/bin/create-awesome-rust-app"
}
