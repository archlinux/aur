# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=connectagram
pkgver=1.3.0
pkgrel=1
pkgdesc='A word unscrambling game'
arch=('x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt6-base')
makedepends=('qt6-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('2c85f82f2bab812868c8180150ec9bbe4dc9283ae0e7fe63dbff207b05216a3a')

build() {
  cd "$pkgname-$pkgver"

  qmake6 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
