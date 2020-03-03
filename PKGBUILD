# Maintainer: Michal Wojdyla <micwoj9292 at gmail dot com>

_pkgname=PySensors
pkgname=python-pysensors
pkgver=0.0.4
pkgrel=1
pkgdesc="Python bindings to libsensors (via ctypes)"
arch=('any')
depends=('python' 'lm_sensors')
makedepends=('python-setuptools')
url="https://bitbucket.org/blackjack/pysensors/"
license=('Apache' 'MIT')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('beb0def410d29ee46fe196a7811124772abf84cbe3a0d8b01d80b81fba31dae5')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}