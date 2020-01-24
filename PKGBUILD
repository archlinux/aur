# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proby
pkgver=0.3.0
pkgrel=1
pkgdesc="Check whether hosts are reachable on certain ports and return result on HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/proby"
license=(MIT)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::https://github.com/svenstaro/proby/archive/${pkgver}.tar.gz)
sha512sums=('0703ee6852312ed95e95f368ad1fd78456678ed074cca1ea6e2fd7e6d61e2827e83023c43e194c5ae3028eb721251a93294664f13d5fb895fbadc09bea0b5c5f')

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
