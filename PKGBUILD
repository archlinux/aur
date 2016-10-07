# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=connectagram
pkgver=1.2.2
pkgrel=1
pkgdesc='A word unscrambling game'
arch=('i686' 'x86_64')
url="http://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("http://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('db70a99970fef66a4864ad15f78187672014b344063024b72778858eed72f756')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
