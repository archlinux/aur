# Maintainer: Graeme Gott <graeme@gottcode.org>

pkgname=kapow
pkgver=1.5.8
pkgrel=1
pkgdesc='Punch clock to track time spent on projects'
arch=('i686' 'x86_64')
url="https://gottcode.org/$pkgname/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
source=("https://gottcode.org/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha256sums=('82a9c6484c87d8c218aacf3dc1e459e6604f1692bfc58030be2b8e784f103f8e')

build() {
  cd "$pkgname-$pkgver"

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir/" install
}
