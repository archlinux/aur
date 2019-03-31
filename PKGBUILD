# Maintainer: ftilde <ftilde at protonmail dot com>
pkgname=ugdb
pkgver=0.1.2
pkgrel=1
pkgdesc="An alternative TUI for gdb"
arch=('x86_64')
url="https://github.com/ftilde/ugdb"
license=('MIT')
depends=('gdb')
makedepends=('cargo' 'git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ftilde/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('aac2f3bceff7784966925237d8c1c237c4ab62795505a083b40af9bacf1c3304409763caf9a33466ca1bad4e83b9e9fdde6608d4c05a73447313a419f406beba')

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
