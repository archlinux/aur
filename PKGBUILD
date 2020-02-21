# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >
pkgname=evcxr_repl
pkgver=0.5
pkgrel=1
pkgdesc="A Rust REPL based on evcxr"
arch=('i686' 'x86_64')
url="https://github.com/google/evcxr"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('evcxr_repl')
source=("$pkgname-$pkgver::git+https://github.com/google/evcxr#tag=239e431c58d04c641da22af791e4d3e1b894365e")
md5sums=("SKIP")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --package $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/evcxr" -t "$pkgdir/usr/bin"
}
