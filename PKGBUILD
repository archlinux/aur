# Maintainer: a821
# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-canvas-core
pkgver=0.1.24
pkgrel=1
pkgdesc="Orange Canvas core workflow editor."
arch=('i686' 'x86_64')
url="https://orangedatamining.com"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-docutils' 'python-anyqt' 'python-pip' 'python-requests' 'python-cachecontrol'
         'python-dictdiffer' 'python-commonmark' 'python-lockfile' 'python-qasync')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange-canvas-core/archive/${pkgver}.tar.gz")
sha256sums=('e0765a7b6715d3f476357096a8e2648dea1dc04bf870231206025422f5c882a1')

build() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
