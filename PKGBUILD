# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.1
pkgrel=1
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('7eaf5c442e8447615878a05d593ada659632a43fa5648467e507ffa51ca174049fe4bbfc9b1e556cd6dece045fef028b62c75dd52e09f1da8a233d11615f616d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/miniserve "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
