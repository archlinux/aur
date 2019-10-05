# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-simpy
_pkgname=${pkgname#python2-}
pkgver=3.0.8
pkgrel=1
pkgdesc="Event discrete, process based simulation for Python."
url="http://simpy.readthedocs.org/en/latest/"
depends=('python2-setuptools')
license=('MIT')
arch=('any')
source=($_pkgname-$pkgver.tar.gz::https://github.com/cristiklein/simpy/archive/$pkgver.tar.gz)
sha256sums=('049dd82c7d45456ff46ca2645f6c5b2950a04fca26afdc09aeaa6bb33326f886')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1 
}
