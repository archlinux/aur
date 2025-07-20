pkgname=calcli
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple calculator CLI app written in Rust"
arch=('x86_64')
url="https://github.com/praneethashok14/calcli"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/calcli" "$pkgdir/usr/bin/calcli"
}
