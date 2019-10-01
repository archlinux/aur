# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proxyboi
pkgver=0.4.0
pkgrel=1
pkgdesc="A super simple reverse proxy with TLS support"
arch=('x86_64')
url="https://github.com/svenstaro/proxyboi"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/proxyboi/archive/${pkgver}.tar.gz)
sha512sums=('a5700ae3afc536dac20457f64c7b3bb98636516bec3f8ff48165ba2c6b4a76edeb9c0895ae2a0954c24bb4c0189a912a1d32000f03c83033e6a201c052065637')

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
