# Maintainer: Marcus Klein <himself@kleini.org>

pkgname=brickstore
pkgver=2022.3.1
pkgrel=1
pkgdesc="BrickStore is a BrickLink offline management tool."
arch=('i686' 'x86_64')
url="https://github.com/rgriebl/brickstore"
license=('GPL')
depends=('qt5-base' 'tbb')
makedepends=('qt5-tools' 'qt5-translations')
source=("https://github.com/rgriebl/brickstore/archive/v$pkgver.tar.gz")
sha256sums=('e181f912d0de573f5af597cc44814f22be4555fe4a85cd9915c3b1dce73fc648')

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5 -r PREFIX=/usr CONFIG+=release
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}
