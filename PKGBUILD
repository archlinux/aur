#Maintainer: chris west <c@xvxx.io>

pkgname=phetch
pkgver=1.2.0
pkgrel=1
pkgdesc="A quick lil gopher client for your terminal."
url="https://github.com/xvxx/phetch"
depends=('openssl')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('a0806d2ea41a70dd803f9a0d8c670995c71982f8e333919251c8fbe004f2de11')

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
