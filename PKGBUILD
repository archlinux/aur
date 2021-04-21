# Maintainer: Paul Irofti <paul@irofti.net>
_name=chama
pkgname="python-$_name"
pkgver=0.1.3
pkgrel=1

pkgdesc="sensor placement optimization"
url="https://github.com/sandialabs/chama"
arch=('any')
license=('Revised BSD')

depends=(python python-pyomo python-pandas python-numpy python-scipy)
makedepends=(python-setuptools)

source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2733b26b042cd1f82a31983bf9f000ee756be5807b527944fb41462c712d6fda')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
