# Maintainer: Nick keddad@yandex.ru

pkgname=communism
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('x86_64')
license=('MIT')
pkgdesc="Tool to control screen brightness on intel devices"
url='https://github.com/keddad/communism'
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d00b3e63d95f2ace2527f5432bd0b956ab8fae2b638bf81464652bf44e09dfcb')


build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
