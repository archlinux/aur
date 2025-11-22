# Maintainer: darrkenn <darrkenn08@gmail.com>
pkgname="confert"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="confert is command line tool to turn config files into html code blocks."
arch=('x86_64')
url="https://github.com/darrkenn/confert"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darrkenn/confert/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('63c35df88b2719779c64840a7766825fa24d40584f96b8998a54b2f82097254d')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
