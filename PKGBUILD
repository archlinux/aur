# Maintainer: tobtoht <dev@featherwallet.org>

pkgname='polyseed'
pkgver=1.0.0
pkgrel=1
pkgdesc='Mnemonic seed library for Monero and other CryptoNote-based currencies.'
arch=('x86_64')
url='https://github.com/tevador/polyseed'
license=('LGPL3')
makedepends=('git' 'cmake')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tevador/polyseed/archive/refs/tags/v1.0.0.tar.gz")

sha256sums=('45f1e6c08575286581079e6e26d341a3a33abe1f1ee2d026bd098cf632ea2349')

build() {
  cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_LIBDIR=/usr/lib/ -DCMAKE_INSTALL_INCLUDEDIR=/usr/include/
  cmake --build build
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
