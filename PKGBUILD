# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=3.1.1
pkgrel=1
pkgdesc="Watches over your Cargo project's source"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("https://github.com/passcod/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('396fc7c188c66bec245e01ae3689cbd164eebe9946b7bd8f16f3606651e5fc0a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
