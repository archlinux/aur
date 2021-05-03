# Maintainer: Reagan McFarland <me@reaganmcf.com>
# Maintainer: Alay Shah <alay.shah@rutgers.edu>
pkgname=lightmon
pkgver=0.2.0
pkgrel=1
pkgdesc="A lightweight, cross-platform, language-agnostic 'run code on file change' tool, inspired by Nodemon"
license=('GPL3')
arch=('x86_64')
url="https://github.com/reaganmcf/lightmon"
makedepends=('git' 'cargo')
source=("git+https://github.com/reaganmcf/lightmon.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  env CARGO_INCREMENTAL=0 cargo build --release --locked
}

package() {
  cd "$pkgname"
  install -D -m755 "target/release/lightmon" "$pkgdir/usr/bin/lightmon"
}
