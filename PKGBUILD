# Maintainer: Lysec

pkgname=swiftfetch
pkgver=1.0.1
pkgrel=1
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
sha256sums=('92bb68dac7aa333e5c3c11f92c1c4673805506ec0656a7b265d283ca0fd27f12')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/swiftfetch "$pkgdir/usr/bin/swiftfetch"

  install -Dm644 config/config.toml "$pkgdir/usr/share/$pkgname/config.toml"
}
