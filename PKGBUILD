# Maintainer: Michael Helmling <michaelhelmling@posteo.de>

pkgbase='python-pytaglib'
pkgname=('python-pytaglib' 'python2-pytaglib')
pkgver=1.1.0
pkgrel=1
pkgdesc="Python bindigs for the TagLib audio metadata library"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/pytaglib"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools' 'taglib')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/p/pytaglib/pytaglib-$pkgver.tar.gz")
md5sums=('1f822375d21a16f80dbd0058acc77559')

build_python-pytaglib() {
  cd "$srcdir/pytaglib-$pkgver"
  python setup.py build
}

build_python2-pytaglib() {
  cd "$srcdir/pytaglib-$pkgver"
  python2 setup.py build
}

package_python-pytaglib() {
  depends=('python' 'taglib')
  cd "$srcdir/pytaglib-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pytaglib() {
  depends=('python2' 'taglib')
  cd "$srcdir/pytaglib-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
