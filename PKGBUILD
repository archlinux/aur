# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.5.0
pkgrel=3
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
makedepends=(cargo)
source=(miniserve-$pkgver.tar.gz::https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('1fa655312cca1281d7f74f748b553d2c31a761158658990d99d65d890157c0b34a32c391b044b34369372d4b1de7765d77651bded1f9e67329237f414583626c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/miniserve "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
