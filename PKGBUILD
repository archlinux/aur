# Maintainer: Ariadna Ardere arxofari@proton.me
pkgname=oppenheimer
pkgver=0.2.0
pkgrel=3
pkgdesc="Taskell-inspired hierarchical listboard for terminal lovers"
arch=('any')
url="https://github.com/rlofc/oppenheimer"
license=('BSD-3-Clause')
makedepends=('cargo')
source=("https://crates.io/api/v1/crates/oppenheimer/${pkgver}/download")
sha256sums=('a11e508ddf7108b3c0debf7d6d52681f0344ac439b41ec4cfd85748c7eca81c4')
options=('!strip')
build() {
  cd "$srcdir/oppenheimer-${pkgver}"

  cargo build --release --locked
}
package() {
  cd "$srcdir/oppenheimer-${pkgver}"

  install -Dm755 target/release/oppenheimer "$pkgdir/usr/bin/oppenheimer"
}
