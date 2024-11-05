# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.8.1
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.8.1.tar.gz")
sha256sums=('6c33493ff11c0e9fbe43981ea7b2a9e3e2582ace46a2ba573d14c53789648467')

build() {
  cd "$pkgname-0.8.1"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-0.8.1"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
