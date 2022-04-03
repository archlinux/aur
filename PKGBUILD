# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=stackprinter
pkgname=python-$_pkgname
pkgver=0.2.6
pkgrel=1
pkgdesc="Debugging-friendly exceptions for Python"
arch=('any')
url="https://github.com/cknd/stackprinter"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('032adf196355e323a25f29de312ea0ba8077036443e4c9ddb55f83fb03d3685d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
