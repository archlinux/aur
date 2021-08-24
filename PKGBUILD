# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=runiq
pkgver=1.2.1
pkgrel=1
pkgdesc="An efficient way to filter duplicate lines from input, à la uniq"
url="https://crates.io/crates/runiq"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('9842e4a6356a5dc51ec902a16aa71f18a1c32f9de9e0c874efe16c88dcb86747')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  cd target/release
  install -Dm755 -t "$pkgdir/usr/bin/" runiq
}
