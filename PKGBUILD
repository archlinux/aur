# Maintainer: Paul Irofti <paul@irofti.net>
_name=PyUtilib
pkgname="python-${_name,,}"
pkgver=6.0.0
pkgrel=1

pkgdesc="collection of Python utilities for Pyomo"
url="https://github.com/PyUtilib/pyutilib"
arch=('any')
license=('BSD')

depends=(python python-nose python-six)
makedepends=(python-setuptools)

source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d3c14f8ed9028a831b2bf51b8ab7776eba87e66cfc58a06b99c359aaa640f040')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
