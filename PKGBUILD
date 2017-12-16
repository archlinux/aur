# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=ethabi
pkgver=4.1.0
pkgrel=1
pkgdesc="Ethereum ABI tools"
arch=('x86_64')
url="https://github.com/paritytech/ethabi"
license=(GPL3)
makedepends=(cargo)
source=(https://github.com/paritytech/ethabi/archive/v${pkgver}.tar.gz)
sha512sums=('19d4d06953181cff1fdba6269ec7f80aa235132457daab7e81bb9c8f684bafec3d0f2ad87eb68e8c52bf21637b0dde2296fbbf9f861a6adf45c9725e445b31e2')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/ethabi "$pkgdir/usr/bin/ethabi"
}

# vim:set ts=2 sw=2 et:
