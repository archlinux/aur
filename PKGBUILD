# Maintainer: Michael Helmling <michaelhelmling@posteo.de>

pkgbase='python-pytaglib'
pkgname=('python-pytaglib' 'python2-pytaglib')
pkgver=1.2.1
pkgrel=1
pkgdesc="Python bindigs for the TagLib audio metadata library"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/pytaglib"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools' 'taglib')
options=(!emptydirs)
source=("https://pypi.python.org/packages/64/2b/ca58714513f1beb587c0a118bdbb70298615c47038eb8c5a2a4334550639/pytaglib-1.2.1.tar.gz")
md5sums=('93c2e178988c43b9e8fdfb489563b04a')

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
