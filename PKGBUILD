# Contributer: Donald Carr<sirspudd@gmail.com>

pkgname=qtcreator-prerelease
_pkgvermajmin=4.0
pkgver=${_pkgvermajmin}.0
_pkgver=${pkgver}-rc1
_filename=qt-creator-opensource-src-${_pkgver}
pkgrel=2
pkgdesc='Qt Creator prerelease'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator')
conflicts=('qtcreator')
depends=('qt5-base')
makedepends=('gcc' 'qt5-base')
source=("https://download.qt.io/development_releases/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.gz")
sha256sums=('33e478b4c5d024bcab07fa6974b2af6818666812ff88f153405bedb557e0c566')

build() {
  cd "$srcdir/${_filename}"
  qmake QTC_PREFIX=/usr qtcreator.pro
  make
}

package() {
  cd "$srcdir/${_filename}"
  INSTALL_ROOT="$pkgdir" make install
}
