# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >
pkgname=evcxr_repl
pkgver=0.9.0
pkgrel=2
pkgdesc="A Rust REPL based on evcxr"
arch=('i686' 'x86_64')
url="https://github.com/google/evcxr"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('evcxr_repl')
source=("https://github.com/google/evcxr/archive/v${pkgver}.tar.gz")
sha256sums=("2b4744ccfb18e26e1112187cc14a9e3e7b14ec21f303ae57e783ed84dcd1f9e4")

build() {
  cd "$srcdir/evcxr-$pkgver/$pkgname"
  cargo build --release --locked --package $pkgname
}

package() {
  cd "$srcdir/evcxr-$pkgver"
  install -Dm755 "target/release/evcxr" -t "$pkgdir/usr/bin"
}
