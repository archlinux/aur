# Maintainer: redponike <proton (dot) me>

_name=orange3-geo
pkgname=python-orange-geo
pkgver=0.5
pkgrel=1
pkgdesc="Orange add-on for dealing with geography and geo-location."
arch=('x86_64')
url="https://github.com/biolab/orange3-geo"
license=('GPL-3.0')
makedepends=('python-setuptools' 'python-trubar')
depends=('python-orange' 'python-shapely' 'python-pyproj' 'python-simplejson' 'python-pillow')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange3-geo/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8f62259142a33d8ee9514e0d745e7505c0da2a7330992131d27a65917361ba76')

build() {
  cd "${_name}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name}-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
