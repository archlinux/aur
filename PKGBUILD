# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rdfm
pkgver=0.1.3
pkgrel=1
pkgdesc="The Rusty DotFiles Manager"
arch=('x86_64')
url="https://github.com/Wafelack/rdfm"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('472d2a4a6da0e102a27747332ef3f08aef40953655d6deefbe3d87c68ad2b05cf2239b89b15a91a6fe217eae156644c427693f7a56d942b1f6cc80cd8c7efe12')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
