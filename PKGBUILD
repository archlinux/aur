pkgname=draw-on-screen
pkgver=1.0.0
pkgrel=1
pkgdesc="Draw on screen"
arch=('x86_64')
url="https://github.com/enheit/drawonscreen_rust"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/drawonscreen_rust"
  cargo build --release --locked
}

package() {
  cd "$srcdir/drawonscreen_rust"
  install -Dm755 "target/release/drawonscreen_rust" "$pkgdir/usr/bin/drawonscreen_rust"
}
