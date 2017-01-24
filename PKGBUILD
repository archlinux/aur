# Maintainer: Johan Reitan <johan.reitan at gmail dot com>
# Contributor: Philip Lorenz <lorenzph@users.sourceforge.net>
pkgname=python-poppler-qt4
_realpkgname=python-poppler-qt4
pkgver=0.25.0
pkgrel=1
pkgdesc="A Python 3 binding to poppler-qt4"
arch=('i686' 'x86_64')
url="https://github.com/wbsoft/python-poppler-qt4"
license=('LGPL')
depends=('python-pyqt4' 'poppler-qt4')
conflicts=('python-poppler-qt')
replaces=('python-poppler-qt')
source=(https://github.com/zehome/$_realpkgname/archive/v$pkgver.tar.gz)
# Fork that fixes a build issue with sip 4.19. Original repo:
#source=(https://github.com/wbsoft/$_realpkgname/archive/v$pkgver.tar.gz)
sha256sums=('2dbff1b9064419037855007eb2cbbf1e680adbc0175c1f0b74d69be4a9feb94a')

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
