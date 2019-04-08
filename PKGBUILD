# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=7.2.1
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e8fe837d6a1dcbdbd81db73142d2204747ebb42851cfb8277e1d1c8c231ec6d400cce6208753c1e637959935544076637c883aea7841e32e24446ec81485ac8c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
