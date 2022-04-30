# Maintainer: a821
# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-widget-base
pkgver=4.17.0
pkgrel=1
pkgdesc="Base widget and workflow definitions for Orange."
arch=('any')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-matplotlib'
         'python-pyqtgraph'
         'python-anyqt'
         'python-typing_extensions'
         'python-orange-canvas-core')
source=("https://files.pythonhosted.org/packages/source/o/${pkgname/python-}/${pkgname/python-}-${pkgver}.tar.gz")
sha256sums=('8897491277ce80a1ea49306552be778ece4d0bf8fad3373388936554c32bccd8')

build() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

