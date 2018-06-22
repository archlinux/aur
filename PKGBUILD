# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=connectagram
pkgver=1.2.8
pkgrel=1
pkgdesc='A word unscrambling game'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('d7b0fcba3f8dee3706af009761c248a234a5c998a45b969c938cb96ef14ab48a')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
