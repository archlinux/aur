# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proxyboi
pkgver=0.4.2
pkgrel=1
pkgdesc="A super simple reverse proxy with TLS support"
arch=('x86_64')
url="https://github.com/svenstaro/proxyboi"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/proxyboi/archive/${pkgver}.tar.gz)
sha512sums=('9fab8b1c2e9aba97d7a15c4b10e41a118b9aa03f5c1c3bc1f47d9cff5f2e2344e0551d160660b4e3bd3250f55c27c5591a9e1244cc568358931a1c4f1ebebe76')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/proxyboi "$pkgdir"/usr/bin/proxyboi
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
