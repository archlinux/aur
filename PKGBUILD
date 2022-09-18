# Maintainer: Paul Irofti <paul@irofti.net>
_name=pytypes
pkgname="python-$_name"
pkgver=1.0b10
pkgrel=1
pkgdesc="typing toolbox w.r.t. PEP 484"
arch=('any')
url="https://github.com/Stewori/pytypes"
license=('Apache')
depends=('python')
makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f9264041c18d8b4779623bc9c10d978e2d2ab73d190fe028f978b3dfcc85256a')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
