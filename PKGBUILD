#Maintainer: chris west <c@xvxx.io>

pkgname=phetch
pkgver=1.0.7
pkgrel=1
pkgdesc="A quick lil gopher client for your terminal."
url="https://github.com/xvxx/phetch"
depends=('openssl')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('1e7a166fa3751d7589e403a2bfcdd279734b390e10f1a679b9fae40660976c94')

build() {
  cd "$pkgname-$pkgver"
  cargo build --locked --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "doc/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
