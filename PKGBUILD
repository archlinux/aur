#Maintainer: chris west <c@xvxx.io>

pkgname=phetch
pkgver=1.0.2
pkgrel=5
pkgdesc="A quick lil gopher client for your terminal."
url="https://github.com/xvxx/phetch"
depends=('openssl')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('026c8ab94878a0910e12bd02e43621beb7ae36df9b47c4f9749bfd80ad0a9f7d')

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
