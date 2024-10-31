# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.7.0
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.7.0.tar.gz")
sha256sums=('ca60a857ab8481c00ab067bef71781971704bce233e89a4ccb25f04ffe15f991')

build() {
  cd "$pkgname-0.7.0"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-0.7.0"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
