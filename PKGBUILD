# Maintainer: Schwonder Reismus <schw0reismus@protonmail.com>

pkgname=toxext
pkgver=0.0.3
pkgrel=1
pkgdesc='An extension library for tox'
arch=('x86_64')
url='https://github.com/$pkgname/$pkgname'
license=('GPL3')
depends=()
makedepends=()
source=("https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('34612e789fb928f9dc79181a61126e3f781ef134d3b5cad2b48c17f1fc3521f0fb6713b0e42e73a789e3eb9b1a566f2d4cbd38a9b26f8f9f6015890be045e4ed')

prepare() {
  cd $pkgname-$pkgver
  mkdir -p build
}

build() {
  cd $pkgname-$pkgver
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  cd build
  make DESTDIR="$pkgdir" install
}
