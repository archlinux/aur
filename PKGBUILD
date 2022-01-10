# Maintainer: Paul Irofti <paul@irofti.net>
_name=jsonpath-ng
pkgname="python-$_name"
pkgver=1.5.3
pkgrel=1
pkgdesc="JSONPath for Python that aims to be standard compliant"
arch=('any')
url="https://github.com/h2non/jsonpath-ng"
license=('Apache')
depends=('python' 'python-ply' 'python-decorator' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/j/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a273b182a82c1256daab86a313b937059261b5c5f8c4fa3fc38b882b344dd567')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
