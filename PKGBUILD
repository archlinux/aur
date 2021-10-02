# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-widget-base
pkgver=4.14.1
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
sha256sums=('36e1cc1fe32682e48647ca7b064a794ce1e4d28595bd33cec3e3798a98839c6e')

build() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

