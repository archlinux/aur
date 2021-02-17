# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-easydev
_pkgname=${pkgname#python-}
pkgver=0.11.0
pkgrel=1
pkgdesc="Provides utilities that are of general usage for the development of Python packages"
arch=('any')
license=('GPL')
depends=('python-sphinx')
url="https://pypi.python.org/pypi/$_pkgname"
source=($_pkgname-$pkgver.tar.gz::https://github.com/cokelaer/easydev/archive/v$pkgver.tar.gz)
sha256sums=('6ae52d5fe9d9c371994d7f30bb0865b4cdba5ea954ed823e665deab4cbc58624')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
