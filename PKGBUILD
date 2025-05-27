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
sha256sums=('2337af48636096b6a14c8dc1fa8e619ca7971af6d0e457205a200262d00333cc')

build() {
  cd "rust-node-modules-cleaner-${pkgver}"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "rust-node-modules-cleaner-${pkgver}"
  install -Dm755 "target/release/node-cleaner" "${pkgdir}/usr/bin/node-cleaner"
}
