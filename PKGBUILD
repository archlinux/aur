# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=bingrep-rs
_pkgname=bingrep
pkgver=0.5.0
pkgrel=1
pkgdesc="Cross-platform binary parser and colorizer"
arch=('x86_64')
url="https://github.com/m4b/bingrep"
license=(MIT)
makedepends=(cargo)
source=("$pkgname.tar.tar"::https://crates.io/api/v1/crates/bingrep/$pkgver/download)
sha512sums=('3db84b799a00cdfa833fcab7672cfebf6981ee1adeb67e85b61a9ee30d621e4a4f8f048d6606f3e0aa7043d0beb00b49db1e32e3ee4c0c00c17ba93c0d48e745')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo build --release
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  cargo test --release
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/release/bingrep "$pkgdir"/usr/bin/bingrep
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
