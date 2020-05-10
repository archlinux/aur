# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>

pkgname=uniconize
pkgver=1.0.1
pkgrel=1
pkgdesc='A workaround for Wine games blackscreening on sway'
arch=('x86_64')
url=https://github.com/neXromancers/uniconize
license=('MPL2')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('9165a0f325dd63c203120906cad408505f51523cc7ba68f85bc699888311fb7358085a66a830ae587f90bace5a8e0e5a9be359932df37d5fa0af1e773b86c6d0')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}

# vim:set ts=2 sw=2 et:
