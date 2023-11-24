# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=stackprinter
pkgname=python-$_pkgname
pkgver=0.2.11
pkgrel=1
pkgdesc="Debugging-friendly exceptions for Python"
arch=('any')
url="https://github.com/cknd/stackprinter"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b30316dd9b7824cfeef73c6364f2d9c8a0fec566b6893d312ff727b03f225156')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
