# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=rustsym
pkgver=0.3.1
pkgrel=1
pkgdesc="Tool to query symbols from rust code for use in IDEs"
url="https://github.com/trixnz/rustsym"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('9ff315a51ca2ea8926ed6595b04f1fbf1bd4689ce0fc4dde75e8dbabf1d587f9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/rustsym "$pkgdir/usr/bin/rustsym"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
