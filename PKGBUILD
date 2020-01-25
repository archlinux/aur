# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proby
pkgver=0.4.0
pkgrel=1
pkgdesc="Check whether hosts are reachable on certain ports and return result on HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/proby"
license=(MIT)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::https://github.com/svenstaro/proby/archive/${pkgver}.tar.gz)
sha512sums=('9be11e9c85c8df9304acca658f32b1cdd4282828809b15294ef5bec2ffb9971df25efed3b53b8c2f4c6ae2a2e2215c02ed05ad71b43787c17a8814ebe588dbab')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/proby "$pkgdir"/usr/bin/proby
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
