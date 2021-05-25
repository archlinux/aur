# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2021.5.2
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base' 'tbb')
makedepends=('qt5-tools' 'qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('bca6dcd96681311f28d6c87fc42c817836cef5f5d83dfaf5d53ffc3c5c9ed509')

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5 -r PREFIX=/usr CONFIG+=release
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
