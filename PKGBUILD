# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-simpy
_pkgname=${pkgname#python2-}
pkgver=3.0.10
pkgrel=1
pkgdesc="Event discrete, process based simulation for Python."
url="http://simpy.readthedocs.org/en/latest/"
depends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('a968f5562d6f2292a139f8a445e2f7d5')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1 
}
