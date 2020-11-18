# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >
pkgname=evcxr_repl
pkgver=0.6.0
pkgrel=1
pkgdesc="A Rust REPL based on evcxr"
arch=('i686' 'x86_64')
url="https://github.com/google/evcxr"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('evcxr_repl')
source=("https://github.com/google/evcxr/archive/v${pkgver}.tar.gz")
sha256sums=("b45534f70f36476552a8b2b20586d12ca335b830cb00d92ea5fb516a3ba4887f")

build() {
  cd "$srcdir/evcxr-$pkgver/$pkgname"
  cargo build --release --locked --package $pkgname
}

package() {
  cd "$srcdir/evcxr-$pkgver"
  install -Dm755 "target/release/evcxr" -t "$pkgdir/usr/bin"
}
