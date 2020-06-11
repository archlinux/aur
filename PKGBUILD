# Maintainer: Sorah Fukumori <her@sorah.jp>
pkgname=subsystemctl
pkgver=0.1.0
pkgrel=1
pkgdesc="Run systemd in WSL2"
arch=('x86_64' 'aarch64')
url="https://github.com/sorah/subsystemctl"
license=('MIT')
makedepends=('cargo')
source=(
  "https://github.com/sorah/subsystemctl/archive/v${pkgver}.tar.gz"
)

build() {
  cd "subsystemctl-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "subsystemctl-$pkgver"
  install -Dm6755 target/release/subsystemctl "${pkgdir}/usr/bin/subsystemctl"
}
sha512sums=('b67ebc9bb31e3f2b928ac3aff5f73ee28f5756b2e7503bca8ee5fcc782d94d46bdd8d29a09b4d2de904c6b63cfb82a210af106f0e6bae2dc798ae511d59ce86e')
