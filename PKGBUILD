# Maintainer: Arxari arxofari@proton.me
pkgname=oppenheimer
pkgver=0.4.0
pkgrel=1
pkgdesc="Taskell-inspired hierarchical listboard for terminal lovers"
arch=('any')
url="https://github.com/rlofc/oppenheimer"
license=('BSD-3-Clause')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/oppenheimer/${pkgver}/download")
sha256sums=('0a072617632b28a68788084bec79807d2af7a4add22f4baa9e0e7267bce62baa')
options=('!strip')

build() {
  cd "$srcdir/oppenheimer-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/oppenheimer-${pkgver}"
  install -Dm755 target/release/oppenheimer "$pkgdir/usr/bin/oppenheimer"
}
