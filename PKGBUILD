# Maintainer: darrkenn <darrkenn08@gmail.com>
pkgname="kitty-cat"
pkgver="1.0.2"
pkgrel="1"
pkgdesc="kitty-cat is a command line tool that fetches a cat from CATAAS and displays it in your terminal."
arch=('x86_64')
url="https://github.com/darrkenn/kitty-cat"
license=('MIT')
optdepends=('kitty' 'viu')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darrkenn/kitty-cat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99f8815d062bb9666b52d06f392fd4dd4a864896f35ea583777fd3a5e424ad0f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
