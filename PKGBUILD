# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cargo-tree
pkgver=0.11.0
pkgrel=1
pkgdesc="Cargo subcommand that visualizes a crate's dependency graph in a tree-like format"
url='https://github.com/sfackler/cargo-tree'
depends=('cargo')
makedepends=('cmake')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6c82f9480c13753d440f4b3204fb058761a22e9c84aaa6e2980da5d341d6d294')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
