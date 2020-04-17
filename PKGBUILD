# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>

pkgname=uniconize
pkgver=1.0.0
pkgrel=1
pkgdesc='A workaround for Wine games blackscreening on sway'
arch=('x86_64')
url=https://github.com/neXromancers/uniconize
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('ec608efce6934b48d130c010aae7f457443a2d7b07663de9bcd1e0627d03671f081a520f772967b94f10e461668281101ea9596fdb296a7b7cf43fbf00c1286c')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}

# vim:set ts=2 sw=2 et:
