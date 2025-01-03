# Maintainer: Lysec

pkgname=swiftfetch
pkgver=1.0.1
pkgrel=2
pkgdesc="A fast and efficient fetch utility written in Rust"
arch=('x86_64')
url="https://github.com/Ly-sec/swiftfetch"
license=('MIT')
depends=(
  gcc-libs
  glibc
)
makedepends=(
  rust
  cargo
  git
)
install="$pkgname.install"
source=("git+https://github.com/Ly-sec/swiftfetch.git#tag=v${pkgver}")
sha256sums=('2dc17f88851a688c1021dd4b2bf21cf31da71f21ea4951f372f1c4c3ed64d90a')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/swiftfetch "$pkgdir/usr/bin/swiftfetch"

  install -Dm644 config/config.toml "$pkgdir/usr/share/$pkgname/config.toml"
}
