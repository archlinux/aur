# Maintainer: Brean
pkgname=('node-cleaner')
pkgver='0.2.16'
pkgrel=1
pkgdesc='A tool for cleaning and managing node_modules directories'
arch=('any')
url='https://github.com/Breinss/rust-node-modules-cleaner'
license=('MIT')
makedepends=('rust' 'cargo')
source=("node-cleaner-0.2.16.tar.gz::https://github.com/Breinss/rust-node-modules-cleaner/archive/v0.2.16.tar.gz")
sha256sums=('230c5ae195b25023a7f84448e2eeb8a1eb83a90e8ea6d6008aca63bc97dec442')

build() {
  cd "rust-node-modules-cleaner-${pkgver}"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "rust-node-modules-cleaner-${pkgver}"
  install -Dm755 "target/release/node-cleaner" "${pkgdir}/usr/bin/node-cleaner"
}
