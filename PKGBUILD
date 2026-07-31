# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=1.0.0
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v1.0.0.tar.gz")
sha256sums=('123bbf1859e493491e3424718e17c9f5adaa4f737709e928d536218ae0a50554')

build() {
  cd "$pkgname-1.0.0"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-1.0.0"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
