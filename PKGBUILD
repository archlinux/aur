# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=runiq
pkgver=1.2.2
pkgrel=1
pkgdesc="An efficient way to filter duplicate lines from input, à la uniq"
url="https://crates.io/crates/runiq"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('f3fd0f7fae68284f64d76a05afcb4469049ac8933737078045e730855c221293')

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
