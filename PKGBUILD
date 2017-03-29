# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=4.0.0
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7f08337f2ea557bbc051410253dfb7a137cbe7a9b4b868c104bdb04ecd2e101e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
