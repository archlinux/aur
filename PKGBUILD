# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-middleware-kilo"
pkgver=1.0.0
pkgrel=1
pkgdesc="Oslo WSGI middleware library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.middleware"
license=("Apache")
provides=("python2-oslo-middleware")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.middleware/oslo.middleware-${pkgver}.tar.gz")
sha256sums=('5ccf160ae5ce23f3f59b86535352e3b5a9fa35dab0edc4ede8b17438da559995')

build() {
  cd "${srcdir}/oslo.middleware-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-middleware-kilo() {
  depends=('python2-pbr>=0.6' 'python2-babel>=1.3' 'python2-six>=1.9.0' 'python2-oslo-config>=1.2.0' 'python2-oslo-i18n-kilo>=1.3.0' 'python2-oslo-context-kilo>=0.2.0' 'python2-webob>=1.2.3')
  cd "${srcdir}/oslo.middleware-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
