# Maintainer: ftilde <ftilde at protonmail dot com>
pkgname=ugdb
pkgver=0.1.1
pkgrel=2
pkgdesc="An alternative TUI for gdb"
arch=('x86_64')
url="https://github.com/ftilde/ugdb"
license=('MIT')
depends=('gdb')
makedepends=('cargo' 'git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ftilde/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('3b089690158dc1b1531c0b1c87e8b1b1d5a3ebd41284bb81a5b6d76a62a9591b9b40aab2e8c560f4f87a1c182b5a1fec0688d218be392edbc70966c308ecf2da')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/ugdb" "$pkgdir/usr/bin/ugdb"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
