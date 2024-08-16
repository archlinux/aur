# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.5.0
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.5.0.tar.gz")
sha256sums=('e08cd5b277bc130eacc22b6bf3abc7447282141f002031e9a679ed3ca1478ba0')

build() {
  cd "$pkgname-0.5.0"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-0.5.0"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
