# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dotter-rs
_pkgname=dotter
pkgver=0.9.0
pkgrel=1
pkgdesc="A dotfile manager and templater written in Rust"
arch=('x86_64')
url="https://github.com/SuperCuber/dotter"
license=('Unlicense')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a713596e3b9a94018baa807efff6389e26588c479500d3cb4f31c784dea81a16cf36eed5570bd437b332360c06f944368acf3cdc5cf41582b6c667d12c27e922')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
