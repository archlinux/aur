# Maintainer: Kevin Mäder <kmaeder<AT>kevin-maeder.de>

pkgname=python-reloader
pkgver=0.6
pkgrel=1
pkgdesc="Dependency-based Python module reloader"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/jparise/python-reloader"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
md5sums=('6709441b2dd9a4d22ef13b21d17a72fa')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
