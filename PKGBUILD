# Maintainer: Jan Fader <jan.fader@web.de>

pkgname=python3-sensors
_pkgname=PySensors
pkgver=0.0.4
pkgrel=1
pkgdesc='Python bindings to libsensors'
arch=('any')
url='http://pypi.python.org/pypi/PySensors/'
license=('GPL')
depends=('python3' 'lm_sensors')
source=(https://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('beb0def410d29ee46fe196a7811124772abf84cbe3a0d8b01d80b81fba31dae5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python3 setup.py install -O1 --prefix='/usr' --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
