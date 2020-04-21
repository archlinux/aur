# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.5.10
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('6ba62239f5717422d899573ff50f8a967aea8fbbd79ac57406d6b86a333d027c')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
