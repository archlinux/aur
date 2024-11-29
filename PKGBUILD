# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.9.0
pkgrel=1
url='https://github.com/eugene-babichenko/fixit'
pkgdesc='A utility to fix mistakes in your commands.'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v0.9.0.tar.gz")
sha256sums=('22b5fb2794c37cd808b961e55655dc47a92e2b435145c49aac57beb5d47267c9')

build() {
  cd "$pkgname-0.9.0"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-0.9.0"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
