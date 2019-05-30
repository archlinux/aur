# Maintainer: Michael Helmling <michaelhelmling@posteo.de>

pkgname=python2-pytaglib
pkgver=1.4.5
pkgrel=1
pkgdesc="Python bindigs for the TagLib audio metadata library (Python 2 version)"
arch=('i686' 'x86_64')
url="https://pypi.org/project/pytaglib/"
license=('GPL3')
makedepends=('python2-setuptools' 'taglib')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/02/3b/b7e5fe31527dffa41dd55c8f36c2fdbbf043c0b3d8707a9f9c45f9c49932/pytaglib-1.4.5.tar.gz")
md5sums=('2f530e4d4b6a69478de9b064748be76a')

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
