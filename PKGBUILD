# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
pkgname=openstack_tui
pkgver=0.9.2
pkgrel=1
pkgdesc="Terminal User Interface for the OpenStack written in Rust"
arch=('x86_64')
url="https://github.com/gtema/openstack"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
options=('!lto')
source=("git+$url.git#tag=$pkgname-v$pkgver")
sha256sums=('2c6cf616a8858734d07a42b3835cb8454a89d9e0b6a60089c99d7e6c9b104db6')

build() {
  cd openstack
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --bin ostui
}

package() {
  cd openstack
  install -Dm755 -t "$pkgdir/usr/bin" target/release/ostui
}

