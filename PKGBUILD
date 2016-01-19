# Maintainer: Wesley Chan <wesley-at-example-dot-com>

pkgname=qslog
pkgver=2.1.0
pkgrel=2
pkgdesc="An easy to use logger that is based on Qt's QDebug class."
arch=('i686' 'x86_64')
url="https://bitbucket.org/codeimproved/qslog"
license=('BSD')
depends=('qt5-base')
makedepends=('gcc')
source=(https://bitbucket.org/codeimproved/qslog/get/rel_${pkgver}.tar.bz2)
sha256sums=('bb5bc06ad66ec3dde64048e5f25448f386ad71377f2b58ae3832a05fa600e6f5')

build() {
  cd *-qslog-*
  qmake QsLogSharedLibrary.pro
  make
}

package() {
  cd *-qslog-*
  make INSTALL_ROOT="$pkgdir/" install
}
