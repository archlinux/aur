# Maintainer: redponike <proton (dot) me>
# Contributor: a821
# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-widget-base
_pkgname=orange_widget_base
pkgver=4.25.1
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
         'python-orange-canvas-core'
         'python-trubar')
source=("https://files.pythonhosted.org/packages/source/o/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f1f78d5884c4c1fb957d9c0b9c704461b01b4106ad8361d52add3693dc32baee')

build() {
  cd "${srcdir}/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
