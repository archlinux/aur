# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2022.2.1
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base' 'tbb')
makedepends=('qt5-tools' 'qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('8081142d1d1817b52b1942d5f49e955fbe5b73aa258aef7c75389cb177a9608e')

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5 -r PREFIX=/usr CONFIG+=release
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
