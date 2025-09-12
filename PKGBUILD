# Maintainer: Paul Irofti <paul@irofti.net>
_name=chama
pkgname="python-$_name"
pkgver=0.3.0
pkgrel=1

pkgdesc="sensor placement optimization"
url="https://github.com/sandialabs/chama"
arch=('any')
license=('Revised BSD')

depends=(python python-pyomo python-pandas python-numpy python-scipy)
makedepends=(python-setuptools)

source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('66ce018b901e4efb89318be344024ef0b30624743a562bb28d6d94699db03eb1')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
