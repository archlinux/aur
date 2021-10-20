# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >
pkgname=evcxr_repl
pkgver=0.12.0
pkgrel=1
pkgdesc="A Rust REPL based on evcxr"
arch=('i686' 'x86_64')
url="https://github.com/google/evcxr"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('evcxr_repl')
source=("https://github.com/google/evcxr/archive/v${pkgver}.tar.gz")
sha256sums=("8274dd36d179f7c60b41e02f6c79807c713db293c051980cb1153ad6771967da")

build() {
  cd "$srcdir/evcxr-$pkgver/$pkgname"
  cargo build --release --locked --package $pkgname
}

package() {
  cd "$srcdir/evcxr-$pkgver"
  install -Dm755 "target/release/evcxr" -t "$pkgdir/usr/bin"
}
