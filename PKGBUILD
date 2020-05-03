# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >
pkgname=evcxr_repl
pkgver=0.5.1
pkgrel=1
pkgdesc="A Rust REPL based on evcxr"
arch=('i686' 'x86_64')
url="https://github.com/google/evcxr"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('evcxr_repl')
source=("$pkgname-$pkgver::git+https://github.com/google/evcxr#tag=582ce09f216d4812f7d152f6eedf0b034fc4dbbd")
md5sums=("SKIP")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --package $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/evcxr" -t "$pkgdir/usr/bin"
}
