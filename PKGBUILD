# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.10.0
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.10.0.tar.gz")
sha256sums=('f7f075810575a609bb1a9ff6209e68fc2dfb9e80ad2d2ed552acde7fb1d9f889')

build() {
  cd "$pkgname-0.10.0"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-0.10.0"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
