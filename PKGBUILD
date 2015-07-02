# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-service-liberty"
pkgver=0.2.0
pkgrel=1
pkgdesc="Oslo Service library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.service"
license=("Apache")
provides=("python2-oslo-service")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.service/oslo.service-${pkgver}.tar.gz")
sha256sums=('c40f7234ae46dc5c7ed5b12123c865fc7f448a1fb272c21c397f44a025435ea8')

build() {
  cd "${srcdir}/oslo.service-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-service-liberty() {
  depends=('python2-babel>=1.3' 'python2-pbr>=0.6')
  cd "${srcdir}/oslo.service-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
