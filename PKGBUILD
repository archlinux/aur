# Maintainer: Johan Reitan <johan.reitan at gmail dot com>
# Contributor: Philip Lorenz <lorenzph@users.sourceforge.net>
pkgname=python-poppler-qt4
_realpkgname=python-poppler-qt4
pkgver=0.24.0
pkgrel=1
pkgdesc="A Python 3 binding to poppler-qt4"
arch=('i686' 'x86_64')
url="https://github.com/wbsoft/python-poppler-qt4"
license=('LGPL')
depends=('python-pyqt4' 'poppler-qt4')
conflicts=('python-poppler-qt')
replaces=('python-poppler-qt')
source=(https://github.com/wbsoft/$_realpkgname/archive/v$pkgver.tar.gz)
sha256sums=('164297bcb03dc0cd943342915bf49e678db13957ebc2f1f3bd988f04145fb236')

_build_ext_args="--qmake-bin=/usr/bin/qmake-qt4"

build() {
  cd "$srcdir/$_realpkgname-$pkgver"

  python setup.py build_ext ${_build_ext_args}
}

package() {
  cd "$srcdir/$_realpkgname-$pkgver"

  python setup.py install --root="${pkgdir}" \
                  build_ext ${_build_ext_args}
}

# vim:set ts=2 sw=2 et:
