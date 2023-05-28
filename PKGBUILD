# Maintainer: Paul Irofti <paul@irofti.net>
_name=chama
pkgname="python-$_name"
pkgver=0.2.0
pkgrel=1

pkgdesc="sensor placement optimization"
url="https://github.com/sandialabs/chama"
arch=('any')
license=('Revised BSD')

depends=(python python-pyomo python-pandas python-numpy python-scipy)
makedepends=(python-setuptools)

source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7233d74328fc16a3ede066f1b7a927aa8874be69c271803b72dc0615a2f29f96')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
