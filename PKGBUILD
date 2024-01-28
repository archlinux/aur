# Maintainer: Paul Irofti <paul@irofti.net>
_name=jsonpath-ng
pkgname="python-$_name"
pkgver=1.6.1
pkgrel=1
pkgdesc="JSONPath for Python that aims to be standard compliant"
arch=('any')
url="https://github.com/h2non/jsonpath-ng"
license=('Apache')
depends=('python' 'python-ply' 'python-decorator' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/j/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('086c37ba4917304850bd837aeab806670224d3f038fe2833ff593a672ef0a5fa')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
