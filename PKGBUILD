# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.10.1
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base' 'tbb')
makedepends=('qt5-tools' 'qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('fcaaba22bc3acc02bf5d3a17f0eb6e80bac5454568e3ce4dad3f2226ecb3f6d2')

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5 -r PREFIX=/usr CONFIG+=release
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
