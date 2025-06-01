# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
pkgname=openstack_tui
pkgver=0.12.2
pkgrel=1
pkgdesc="Terminal User Interface for the OpenStack written in Rust"
arch=('x86_64')
url="https://github.com/gtema/openstack"
license=('Apache-2.0')
depends=()
makedepends=(
  'cargo'
  'git'
)
options=('!lto')
source=("git+$url.git#tag=$pkgname-v$pkgver")
sha256sums=('cf82afe1108903e51072ada4e889bad508f0f44fea7c589d6ee4ef62230b039b')

build() {
  cd openstack
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --bin ostui
}

package() {
  cd openstack
  install -Dm755 -t "$pkgdir/usr/bin" target/release/ostui
}

