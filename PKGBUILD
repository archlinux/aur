# Maintainer: İrem Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >
pkgname=evcxr_repl
pkgver=0.14.1
pkgrel=1
pkgdesc="A Rust REPL based on evcxr"
arch=('i686' 'x86_64')
url="https://github.com/google/evcxr"
license=('Apache')
depends=('gcc-libs' 'rust-src')
provides=('evcxr_repl')
source=("https://github.com/google/evcxr/archive/v${pkgver}.tar.gz")
sha256sums=("4dc9cb305ae832e8ed1712fa35cf365daaa89cf1950e8c285cf87bd7cdfc49bc")

build() {
  cd "$srcdir/evcxr-$pkgver/$pkgname"
  cargo build --release --locked --package $pkgname
}

package() {
  cd "$srcdir/evcxr-$pkgver"
  install -Dm755 "target/release/evcxr" -t "$pkgdir/usr/bin"
}
