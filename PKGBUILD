# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
pkgname=openstack_cli
pkgver=0.6.4
pkgrel=1
pkgdesc="CLI for the OpenStack written in Rust"
arch=('x86_64')
url="https://github.com/gtema/openstack"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
options=('!lto')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('4f11e254338fa78c52bb9fca8c79954150e07ae8d5fec746e9f6061c3da9a250')

build() {
  cd openstack
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --bin osc
}

package() {
  cd openstack
  install -Dm755 -t "$pkgdir/usr/bin" target/release/osc
}

