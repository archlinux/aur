# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>

_pkgname=tox-node
pkgname=$_pkgname-rs
pkgver=0.0.5
pkgrel=1
pkgdesc="A server application to run tox node written in pure Rust"
arch=('i686' 'x86_64')
depends=('libsodium')
makedepends=('rust' 'cargo')
url="https://github.com/tox-rs/tox-node"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tox-rs/tox-node/archive/v$pkgver.tar.gz")
sha256sums=('4a58080374be2b38b8b55c306562697c56149d2c8a63e8517fce530d490e2237')
provides=('tox-node-rs')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo install --root "$pkgdir/usr"
  rm -f "$pkgdir/usr/.crates.toml"
}
