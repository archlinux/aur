# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=7.3.0
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c9a281e9b713a5dfc6a075a71ad2d8823b6eb8cd40d2f6e57c9a7849a906e2e641540826a972e991194e58c04050216f97ef305673c653ab00edf6444950b165')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
