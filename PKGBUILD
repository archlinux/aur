# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
pkgname=openstack_cli
pkgver=0.7.0
pkgrel=1
pkgdesc="CLI for the OpenStack written in Rust"
arch=('x86_64')
url="https://github.com/gtema/openstack"
license=('Apache-2.0')
depends=()
makedepends=('cargo')
options=('!lto')
source=("git+$url.git#tag=$pkgname-v$pkgver")
sha256sums=('f30245ae92142b82851c4420624205fd36a68aed5cf1e2e28eec11467dfdd769')

build() {
  cd openstack
  export CARGO_HOME="$srcdir/cargo-home"
  cargo build --release --bin osc
}

package() {
  cd openstack
  install -Dm755 -t "$pkgdir/usr/bin" target/release/osc
}

