# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-simpy
_pkgname=${pkgname#python2-}
pkgver=3.0.11
pkgrel=1
pkgdesc="Event discrete, process based simulation for Python."
url="http://simpy.readthedocs.org/en/latest/"
depends=('python2-setuptools')
license=('MIT')
arch=('any')
#source=($_pkgname-$pkgver.tar.gz::https://github.com/cristiklein/simpy/archive/$pkgver.tar.gz)
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d09625b9b01f34242ae100fe6bdb6c9508da181a08419ab00cc2bd47c7ec0f43')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1 
}
