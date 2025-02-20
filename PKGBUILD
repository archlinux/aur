# Maintainer: redponike <proton (dot) me>

_name=orange3-educational
pkgname=python-orange-educational
pkgver=0.8.0
pkgrel=1
pkgdesc="Educational widgets for machine learning and data mining in Orange 3. Orange add-on."
arch=('x86_64')
url="https://github.com/biolab/orange3-educational"
license=('GPL-3.0')
makedepends=('python-setuptools')
depends=('python-orange')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange3-educational/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0821facdfca5fe7bd4383d1d894abfb1e9e9b2ffae446b476fc3b59abb1f6b37')

build() {
  cd "${_name}-$pkgver"
  python setup.py build
}

package() {
  cd "${_name}-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
