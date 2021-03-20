# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-canvas-core
pkgver=0.1.19
pkgrel=1
pkgdesc="Orange Canvas core workflow editor."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-docutils' 'python-anyqt' 'python-pip' 'python-requests' 'python-cachecontrol' 'python-dictdiffer' 'python-commonmark')
source=("https://github.com/biolab/orange-canvas-core/archive/${pkgver}.tar.gz")
sha256sums=('13482b20aec0a11bbb27325943df57c5f17f2f3cef3dd6569933c3ba478e8359')

build() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-canvas-core-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

