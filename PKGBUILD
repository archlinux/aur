# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=5.0.2
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo' 'watchexec')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('aa4fb47812296d920bc26682620ed6530a7b3014c5f141909db7aaa7795bddd3')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
