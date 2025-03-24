# Maintainer: Paul Irofti <paul@irofti.net>
_name=liac-arff
pkgname="python-$_name"
pkgver=2.5.0
pkgrel=2
pkgdesc="read and write ARFF files in Python"
arch=('any')
url="https://github.com/renatopp/liac-arff"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
# 404: source=("https://files.pythonhosted.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/6e/43/73944aa5ad2b3185c0f0ba0ee6f73277f2eb51782ca6ccf3e6793caf209a/${_name}-${pkgver}.tar.gz")
sha256sums=('3220d0af6487c5aa71b47579be7ad1d94f3849ff1e224af3bf05ad49a0b5c4da')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
