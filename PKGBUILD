# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-widget-base
pkgver=4.14.0
pkgrel=1
pkgdesc="Base widget and workflow definitions for Orange."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-matplotlib'
         'python-pyqtgraph'
         'python-anyqt'
         'python-typing_extensions'
         'python-orange-canvas-core')
source=("https://files.pythonhosted.org/packages/source/o/${pkgname/python-}/${pkgname/python-}-${pkgver}.tar.gz")
sha256sums=('6c62db1154ff2aace32100f08e124db3de24bc6b0928c9d643797cf7c5fcee16')

build() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

