# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=python-sphinx-math-dollar
pkgname=$_name
pkgver=1.2.1
_mainfolder=sphinx-math-dollar-$pkgver
pkgrel=1
pkgdesc='Sphinx extension to let you write LaTeX math using $$'
arch=(any)
url=https://github.com/sympy/sphinx-math-dollar
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('0d967162727ea71a4933ac18667edd584b54bc077ba699e2cd9c82d4685e3b12')

build() {
  cd "$srcdir/$_mainfolder"
  python setup.py build
}

package() {
  cd "$srcdir/$_mainfolder"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
