# Contributer: Donald Carr<sirspudd@gmail.com>

pkgname=qtcreator-prerelease
pkgver=4.0.0
_pkgver=${pkgver}-beta1
_filename=qt-creator-opensource-src-${_pkgver}
pkgrel=1
pkgdesc='Qt Creator prerelease'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator')
conflicts=('qtcreator')
depends=('qt5-base')
makedepends=('gcc' 'qt5-base')
source=("https://download.qt.io/development_releases/qtcreator/4.0/4.0.0-beta1/${_filename}.tar.gz")
sha256sums=('a7d95b5c64db413e0a89fe879a5a5ba614bb7c00ae94ba2736a3d9c462969fcb')

build() {
  cd "$srcdir/${_filename}"
  qmake QTC_PREFIX=/usr qtcreator.pro
  make
}

package() {
  cd "$srcdir/${_filename}"
  INSTALL_ROOT="$pkgdir" make install
}
