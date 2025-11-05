# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=file_clipper
pkgver=0.1.3
_binname=clp
pkgrel=1
pkgdesc="Command line utility for copying/moving files"
arch=('x86_64')
url="https://github.com/ruiiiijiiiiang/file_clipper"
license=('MIT')
provides=("$_binname")
conflicts=("$_binname")
depends=('glibc')
makedepends=('cargo' 'rust')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ruiiiijiiiiang/file_clipper/archive/v$pkgver.tar.gz")
sha256sums=('e61e1d9ab3135c03a2546e9e3ea242ba1bfdba127b0482b32ed887c4942b4d9e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 "target/release/$_binname" "$pkgdir/usr/bin/$_binname"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
