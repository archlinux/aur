# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=3.1.2
pkgrel=1
pkgdesc="Watches over your Cargo project's source"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3692824d3ea3822d29425ffcc8f169914e93c2da08cd3c027d579815af6d1795')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
