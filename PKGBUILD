# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=2.1.5
pkgrel=1
pkgdesc="Utility for cargo to compile projects when sources change "
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo' 'rust')
source=("https://github.com/passcod/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6b1ac3dd563dd88289374e04c404295e077b55c4493b190e7bee7e31883fcffd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/cargo-watch" \
    "$pkgdir/usr/bin/cargo-watch"
}
