# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-py2vega
_pkgname=py2vega
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python to Vega-expression transpiler"
arch=('any')
url="https://github.com/bloomberg/py2veg"
license=('BSD')
depends=('python' 'python-gast')
checkdepends=('python-pytest')
optdepends=()
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ef45cdef92797550267607d26b3a39ee259d752bdc97627cf1feaefb4a20c8b6')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
  cd $_pkgname-$pkgver
  pytest -vv test
}

# vim:ts=2:sw=2:et:
