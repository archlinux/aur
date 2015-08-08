# Maintainer: Philip Lorenz <lorenzph@users.sourceforge.net>
pkgname=python2-poppler-qt4
_realpkgname=python-poppler-qt4
pkgver=0.24.0
pkgrel=1
pkgdesc="A Python 2 binding to poppler-qt"
arch=('i686' 'x86_64')
url="https://github.com/wbsoft/python-poppler-qt4"
license=('LGPL')
depends=('python2-pyqt4' 'poppler-qt4' 'python2')
source=(https://github.com/wbsoft/$_realpkgname/archive/v$pkgver.tar.gz)
conflicts=('python2-poppler-qt<=0.24.0')

md5sums=('c6d4a1038329350ca01704e7c2613f4f')

_build_ext_args="--qmake-bin=/usr/bin/qmake-qt4"

build() {
  cd "$srcdir/$_realpkgname-$pkgver"

  python2 setup.py build_ext ${_build_ext_args}
}

package() {
  cd "$srcdir/$_realpkgname-$pkgver"

  python2 setup.py install --root="${pkgdir}" \
                   build_ext ${_build_ext_args}
}

# vim:set ts=2 sw=2 et:
