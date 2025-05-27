# Maintainer: Brean
pkgname=('node-cleaner')
pkgver='0.2.12'
pkgrel=1
pkgdesc='A tool for cleaning and managing node_modules directories'
arch=('any')
url='https://github.com/Breinss/rust-node-modules-cleaner'
license=('MIT')
makedepends=('rust' 'cargo')
source=("node-cleaner-0.2.12.tar.gz::https://github.com/Breinss/rust-node-modules-cleaner/archive/v0.2.12.tar.gz")
sha256sums=('SKIP')

build() {
  cd "node-cleaner-0.2.12"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "node-cleaner-0.2.12"
  install -Dm755 "target/release/node-cleaner" "${pkgdir}/usr/bin/node-cleaner"
}
