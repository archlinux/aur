# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=3.0.4
pkgrel=1
pkgdesc="Utility for cargo to compile projects when sources change "
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("https://github.com/passcod/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f3f4d7387c31d0c5cb2121c4ebcc833038b5351831925c3f4b8735a46dc32f0c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
}
