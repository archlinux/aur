# Maintainer: redponike <proton (dot) me>
# Contributor: a821
# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-canvas-core
pkgver=0.2.5
pkgrel=2
pkgdesc="Orange Canvas core workflow editor."
arch=('x86_64')
url="https://orangedatamining.com"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-docutils' 'python-anyqt' 'python-pip' 'python-requests' 'python-cachecontrol'
         'python-dictdiffer' 'python-commonmark' 'python-lockfile' 'python-qasync'
         'python-trubar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange-canvas-core/archive/${pkgver}.tar.gz")
sha256sums=('302768229eab2497bc900d7dcbedd913b6d6fa6c1d336593dbe3e19abc49cf53')

build() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
