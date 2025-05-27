# Maintainer: Brean
pkgname=('node-cleaner')
pkgver='0.2.19'
pkgrel=1
pkgdesc='A tool for cleaning and managing node_modules directories'
arch=('any')
url='https://github.com/Breinss/rust-node-modules-cleaner'
license=('MIT')
makedepends=('rust' 'cargo')
source=("node-cleaner-0.2.19.tar.gz::https://github.com/Breinss/rust-node-modules-cleaner/archive/v0.2.19.tar.gz")
sha256sums=('347c2052f73ed5a1b1ecd40fbc7039af8a7e1506e5628f4c3197a644a6579b4f')

build() {
  cd "rust-node-modules-cleaner-${pkgver}"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "rust-node-modules-cleaner-${pkgver}"
  install -Dm755 "target/release/node-cleaner" "${pkgdir}/usr/bin/node-cleaner"
}
