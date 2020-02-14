# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=ethabi
pkgver=7.0.0
pkgrel=1
pkgdesc="Ethereum ABI tools"
arch=('x86_64')
url="https://github.com/paritytech/ethabi"
license=(GPL3)
makedepends=(cargo)
source=(https://github.com/paritytech/ethabi/archive/v${pkgver}.tar.gz)
sha512sums=('fbaafff554e1ea54bda52b50c27727fd4a4ebdc2024d8d5ca2e059ff545a18158ec883c2335c3b431c5334699f1dc4d6c0c6bab5222ffa6a95b0d2e778467d9a')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/ethabi "$pkgdir/usr/bin/ethabi"
}

# vim:set ts=2 sw=2 et:
