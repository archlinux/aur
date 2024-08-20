# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.6.0
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.6.0.tar.gz")
sha256sums=('3035e509c1688e348920e94268a7bd019442fa2a325ab98e722ee95129dd8d7c')

build() {
  cd "$pkgname-0.6.0"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-0.6.0"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
