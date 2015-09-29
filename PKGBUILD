# Maintainer: Wesley Chan <wesley-at-example-dot-com>
pkgname=qslog
pkgver=2.1.0
pkgrel=1
pkgdesc="An easy to use logger that is based on Qt's QDebug class."
arch=('i686' 'x86_64')
url="https://bitbucket.org/razvanpetru/qslog"
license=('BSD')
depends=('qt5-base')
makedepends=('gcc')
source=(https://bitbucket.org/razvanpetru/qslog/get/rel_${pkgver}.tar.bz2)
sha256sums=('06bba4ed0b5fe5867d19810be3581cb250251a4d6ea6174e24039d69a932bc98')

build() {
  cd razvanpetru-qslog-*
  qmake QsLogSharedLibrary.pro
  make
}

package() {
  cd razvanpetru-qslog-*
  make INSTALL_ROOT="$pkgdir/" install
}
