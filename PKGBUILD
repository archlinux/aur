# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.8.0
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.8.0.tar.gz")
sha256sums=('c630a3e8a6600a2ec4f64ec3d03bbaba5ecd6edf2216df90f9e858d8d204c9b0')

build() {
  cd "$pkgname-0.8.0"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-0.8.0"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
