# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2022.1.3
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base' 'tbb')
makedepends=('qt5-tools' 'qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('d7f5b77f97f2fcfa93c4fbf457d99853711536770a368064148942b07c6e0e80')

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5 -r PREFIX=/usr CONFIG+=release
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
