# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=3.0.1
pkgrel=1
pkgdesc="Utility for cargo to compile projects when sources change "
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo' 'rust')
source=("https://github.com/passcod/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('64c047d75f946b996185932f556e45aac69a62a11f50863bdea830117d7536b7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
}
