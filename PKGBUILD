# Maintainer: a821
# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-widget-base
pkgver=4.19.0
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
sha256sums=('193055dbee8701ad62d5471c5287b092ce53bb77f7f810ec68bf96816f6acaa2')

build() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  SETUPTOOLS_USE_DISTUTILS=stdlib python setup.py build
}

package() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  SETUPTOOLS_USE_DISTUTILS=stdlib python setup.py install --root="${pkgdir}" --optimize=1
}

