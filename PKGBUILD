# Maintainer: darrkenn <darrkenn08@gmail.com>
pkgname="confert"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="confert is command line tool to turn config files into html code blocks."
arch=('x86_64')
url="https://github.com/darrkenn/confert"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/darrkenn/confert/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c8bd196885b24ffd55e7e368eaabefd15c959171e37d4a13d16eeefd6a85c51')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
