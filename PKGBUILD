# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: https://wiki.qt.io/Qt_Build_Suite
#
# For improvements/fixes to this package, please send a pull request:
# http://code.qt.io/cgit/qt-labs/qbs.git/

pkgname=qbs
pkgver=1.4.4
pkgrel=1
pkgdesc='Qt Build Suite: Build tool that helps simplify the build process for developing projects across multiple platforms.'
arch=('x86_64' 'i686')
url='https://code.qt.io/qt-labs/qbs.git'
license=('LGPL')
conflicts=('qtcreator')
depends=('qt5-base' 'qt5-script')
makedepends=('gcc')
source=("https://download.qt.io/official_releases/qbs/${pkgver}/qbs-src-${pkgver}.tar.gz")
sha256sums=('23fb37bfbe775907a2593f716b17151f25995ec37cd5bedabaf266781078b404')

build() {
  cd "$srcdir/qbs-src-$pkgver"
  qmake QBS_INSTALL_PREFIX=/usr qbs.pro 
  make
}

package() {
  cd "$srcdir/qbs-src-$pkgver"
  INSTALL_ROOT="$pkgdir" make install
}
