# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=oha
pkgver=0.2.3
pkgrel=1
pkgdesc="Ohayou(おはよう), HTTP load generator, inspired by rakyll/hey with tui animation"
arch=('x86_64')
url="https://github.com/hatoo/oha"
license=(MIT)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::https://github.com/hatoo/oha/archive/v${pkgver}.tar.gz)
sha512sums=('de0b9157dee042bd5ceb102c409a6b240517a3966455dd7794f988fd00d5ab9f03542516fb3773f11c2ad491e202e195247b32886b19d589a7675a03f4a8fce2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/oha "$pkgdir"/usr/bin/oha
}

# vim:set ts=2 sw=2 et:
