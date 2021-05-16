# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=baru
pkgver=0.2.8
pkgrel=1
pkgdesc='A system monitor written in Rust and C'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL2')
depends=('libpulse')
makedepends=('rust' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0e2eb766919b8151c54684c977e20a064046800142052e6d3a41cbff46baf0ee7734506b203cff779fa1cd624eb4f5c4836af1bda0260bae47bf4d721054216f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dvm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dvm 644 baru.yaml -t "$pkgdir/usr/share/$pkgname/"
}

