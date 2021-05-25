# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=dutree
pkgver=0.2.18
pkgrel=1
pkgdesc='A tool to analyze file system usage written in Rust'
arch=('x86_64')
url=https://github.com/nachoparker/dutree
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('55c30e57cc339dd16141510af33245cc3b82f588f22419fc034f02b36ebecba0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
}
