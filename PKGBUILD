pkgname=statcat
pkgver=V3.1.1-beta
pkgrel=1
pkgdesc="A fast and customizable system fetch written in Rust"
arch=('x86_64')
url="https://github.com/fluffocj/statcat"
license=('MIT')
makedepends=('rust' 'cargo')
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
