# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=runiq
pkgver=1.1.4
pkgrel=1
pkgdesc="An efficient way to filter duplicate lines from input, à la uniq"
url="https://github.com/whitfin/runiq"
makedepends=('cargo')
arch=('x86_64')
license=('MIT')
source=("${url}/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

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