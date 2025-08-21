# Maintainer: darrkenn <darrkenn08@gmail.com>
pkgname="kitty-cat"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="kitty-cat is a command line tool that fetches a cat from CATAAS and displays it in your terminal. Built for Kitty terminal."
arch=('x86_64')
url="https://github.com/darrkenn/kitty-cat"
license=('MIT')
depends=('kitty')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darrkenn/kitty-cat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c7615ac3666bee44fbdcf904a817a6c71daf57c1cbb1ce506a9fc82090db98f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
