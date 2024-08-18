# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.5.1
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.5.1.tar.gz")
sha256sums=('8dbb4c39ac235c94ae9ac6e04b46f721154b66f9aa0886ddfd50eb51231ec053')

build() {
  cd "$pkgname-0.5.1"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-0.5.1"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
