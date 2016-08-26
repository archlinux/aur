# Contributor: Donald Carr <sirspudd@gmail.com>
# Contributor: Jake Petroules <jake.petroules@qt.io>
# Upstream URL: https://wiki.qt.io/Qt_Build_Suite
#
# For improvements/fixes to this package, please send a pull request:
# http://code.qt.io/cgit/qt-labs/qbs.git/

pkgname=qbs
pkgver=1.6.0
pkgrel=1
pkgdesc='Qbs: Build tool that helps simplify the build process for developing projects across multiple platforms.'
arch=('x86_64' 'i686')
url='https://code.qt.io/qt-labs/qbs.git'
license=('LGPL')
conflicts=('qtcreator')
depends=('qt5-base' 'qt5-script')
makedepends=('gcc')
source=("https://download.qt.io/official_releases/qbs/${pkgver}/qbs-src-${pkgver}.tar.gz")
sha256sums=('ae850e957e4a811a193b02a067321722dd0e5fc50b7c370ec34273c1565e78ab')

build() {
  cd "$srcdir/qbs-src-$pkgver"
  qmake QBS_INSTALL_PREFIX=/usr qbs.pro 
  make
}

package() {
  cd "$srcdir/qbs-src-$pkgver"
  INSTALL_ROOT="$pkgdir" make install
}
