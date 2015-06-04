# Maintainer: Justin Dray <justin@dray.be>

_pkgname=PySensors
pkgname=python2-pysensors
pkgver=0.0.3
pkgrel=1
pkgdesc="Python bindings to libsensors (via ctypes)"
arch=('any')
depends=('python2' 'lm_sensors')
makedepends=('python2-setuptools')
url="https://bitbucket.org/blackjack/pysensors/"
license=('Apache' 'MIT')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b735dada5318ce50f2d141d29b102e7a116a5934509583f86302d4b59399e961')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
