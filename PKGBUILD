# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=runiq
pkgver=1.2.0
pkgrel=1
pkgdesc="An efficient way to filter duplicate lines from input, à la uniq"
url="https://github.com/whitfin/runiq"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a72c032e2e382f10764793996ce968022cb4ea3bc15229e92fc7394d2523f843')

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
