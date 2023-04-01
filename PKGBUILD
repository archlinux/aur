# Maintainer: Valentin Heinisch <heinischprg@gmail.com>
pkgname=bacon-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple base conversion tool for the command line"
arch=('x86_64')
url="https://github.com/HeinischValentin/bacon"
license=('GPL')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HeinischValentin/bacon/archive/v$pkgver.tar.gz")
sha512sums=('d0c85d4279dbbe9368ac6eb47ad885c0fb687fb1dd372a675bf2913a0d0fa547e50da6d8adaadc3d898e51b505db4263cd7042894236d4b30b532683bec74456')

build() {
  cd "bacon-$pkgver"

  cargo build --release --locked
}

check() {
  cd "bacon-$pkgver"

  cargo test --release --locked
}

package() {
  cd "bacon-$pkgver"

  install -Dm755 "target/release/bacon" "$pkgdir/usr/bin/bacon"
}
