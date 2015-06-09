# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-cached-property
pkgver=1.2.0
pkgrel=1
pkgdesc="A decorator for caching properties in classes"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/pydanny/cached-property"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/c/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('0a5766b45fbf45416d9857f1c215f710')
sha256sums=('e3081a8182d3d4b7283eeade76c382bcfd4dfd644ca800598229c2ef798abb53')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
