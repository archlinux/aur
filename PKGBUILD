# Maintainer: Michael Helmling <michaelhelmling@posteo.de>

pkgbase='python-pytaglib'
pkgname=('python-pytaglib' 'python2-pytaglib')
pkgver=1.4.0
pkgrel=1
pkgdesc="Python bindigs for the TagLib audio metadata library"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/pytaglib"
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools' 'taglib')
options=(!emptydirs)
source=("https://pypi.python.org/packages/8c/31/3a985f9b32295f3a146bd4e9cda2287fc0dd6d7a8837ad01588299d6ad4f/pytaglib-1.4.0.tar.gz")
md5sums=('4b2a50687061f77deb184e3fa8850806')

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
