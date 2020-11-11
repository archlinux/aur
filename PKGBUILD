# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-easydev
_pkgname=${pkgname#python-}
pkgver=0.10.1
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=('any')
license=('GPL')
depends=('python-sphinx')
url="https://pypi.python.org/pypi/$_pkgname"
source=($_pkgname-$pkgver.tar.gz::https://github.com/cokelaer/easydev/archive/v$pkgver.tar.gz)
sha256sums=('cb9ef44eeb4c7401586089d3558f7321ec87f659ffcff6eab0e3e4c92b8a2c8d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
