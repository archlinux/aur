# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=python2-simpledaemon
pkgver=1.3.0
pkgrel=1
_libname=SimpleDaemon
pkgdesc="Provides a simple Daemon class to ease the process of forking a python application on Unix systems"
arch=(any)
url="http://bitbucket.org/donspaulding/simpledaemon/"
license=('MIT')
depends=(python2)
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
sha256sums=('bb1f3a5baacbfc770227f6837b01d8dcd0454e90f75c385f6a1b7b74fa80e64c')

build() {
  cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
  cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
