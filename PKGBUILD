# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=runiq
pkgver=1.1.4
pkgrel=1
pkgdesc="An efficient way to filter duplicate lines from input, à la uniq"
url="https://github.com/whitfin/runiq"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('44767f578653b7cd7507849e473ad8a96046bdc0ec9529c27c1c9ac778e4e9da')

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