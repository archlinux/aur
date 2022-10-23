# Maintainer: a821
# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-canvas-core
pkgver=0.1.28
pkgrel=1
pkgdesc="Orange Canvas core workflow editor."
arch=('i686' 'x86_64')
url="https://orangedatamining.com"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-docutils' 'python-anyqt' 'python-pip' 'python-requests' 'python-cachecontrol'
         'python-dictdiffer' 'python-commonmark' 'python-lockfile' 'python-qasync')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange-canvas-core/archive/${pkgver}.tar.gz")
sha256sums=('bab9a2720a66b00794a16690821578821a09dedc9a0ced8129b018f78db186f9')

build() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
