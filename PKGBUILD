# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >
pkgname=evcxr_repl
pkgver=0.7.0
pkgrel=1
pkgdesc="A Rust REPL based on evcxr"
arch=('i686' 'x86_64')
url="https://github.com/google/evcxr"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('evcxr_repl')
source=("https://github.com/google/evcxr/archive/v${pkgver}.tar.gz")
sha256sums=("d26fb67f9f6c6e6abe30b00f0158085888aaab2e1e5b37a3f70e48349df86be2")

build() {
  cd "$srcdir/evcxr-$pkgver/$pkgname"
  cargo build --release --locked --package $pkgname
}

package() {
  cd "$srcdir/evcxr-$pkgver"
  install -Dm755 "target/release/evcxr" -t "$pkgdir/usr/bin"
}
