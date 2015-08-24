# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=3.0.0
pkgrel=1
pkgdesc="Utility for cargo to compile projects when sources change "
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo' 'rust')
source=("https://github.com/passcod/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('10b8a587f27fda32bbf0f3f088f8b8a9a86ccb192af43b04bf85634df4ed540b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/cargo-watch" \
    "$pkgdir/usr/bin/cargo-watch"
}
