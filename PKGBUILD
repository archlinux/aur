# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-canvas-core
pkgver=0.1.15
pkgrel=1
pkgdesc="Orange Canvas core workflow editor."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-docutils' 'python-anyqt' 'python-pip' 'python-requests' 'python-cachecontrol' 'python-dictdiffer' 'python-commonmark')
source=("https://github.com/biolab/orange-canvas-core/archive/${pkgver}.tar.gz")
sha256sums=('b37737c162b88c5b849e23eaf87f08ca99da0ecf430c1fad61b70814b9a24b7c')

build() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

