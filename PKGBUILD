# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=7.0.7
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1268c858392efb99fcb0b1cab74c6739fffbf7117fdf8ff327ef929988571abf4a06d143ff1fc6d70f51fa73869a40606fd39cbb043700c1b89b96a88f9df941')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
