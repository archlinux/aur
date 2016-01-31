# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=3.1.0
pkgrel=1
pkgdesc="Utility for cargo to compile projects when sources change "
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("https://github.com/passcod/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('15e6682baea282796460601630bc712249984314c6d414b2832edd507ce7313f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"
}
