# Maintainer: Michael Helmling <michaelhelmling@posteo.de>

pkgname=python2-pytaglib
pkgver=1.4.3
pkgrel=1
pkgdesc="Python bindigs for the TagLib audio metadata library (Python 2 version)"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/pytaglib"
license=('GPL3')
makedepends=('python2-setuptools' 'taglib')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/c7/f0/c6d15860c6ab5953320edd36b5050e9d813d025bd49563ef7a24154b69c7/pytaglib-1.4.3.tar.gz")
md5sums=('e109e5dcf921ed35e7d923712643a423')

build() {
  cd "$srcdir/pytaglib-$pkgver"
  python2 setup.py build
}

package() {
  depends=('python' 'taglib')
  cd "$srcdir/pytaglib-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
