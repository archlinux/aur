pkgname=('node-cleaner')
pkgver='0.2.24'
pkgrel=1
pkgdesc='A tool for cleaning and managing node_modules directories'
arch=('any')
url='https://github.com/Breinss/rust-node-modules-cleaner'
license=('MIT')
source=("https://github.com/Breinss/rust-node-modules-cleaner/archive/v0.2.24.tar.gz")
sha256sums=('SKIP')
makedepends=('rust' 'cargo' 'git')

build() {
  cd "${srcdir}/rust-node-modules-cleaner-0.2.24"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "${srcdir}/rust-node-modules-cleaner-0.2.24"
  install -Dm755 "target/release/node-cleaner" "${pkgdir}/usr/bin/node-cleaner"
}
