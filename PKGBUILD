# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=4.0.3
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3979e71087f84045795db3d47cddc57a2539a345790d6480c3859775d9fb59a7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
