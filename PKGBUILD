# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-middleware-liberty"
pkgver=2.3.0
pkgrel=1
pkgdesc="Oslo WSGI middleware library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.middleware"
license=("Apache")
provides=("python2-oslo-middleware")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.middleware/oslo.middleware-${pkgver}.tar.gz")
sha256sums=('6dfcf73d8676261eec9802b6bb2f4e89b58a6544a79182a838e55831064f8325')

build() {
  cd "${srcdir}/oslo.middleware-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-middleware-liberty() {
  depends=('python2-pbr>=0.6'
           'python2-babel>=1.3'
           'python2-six>=1.9.0'
           'python2-oslo-config-liberty'
           'python2-oslo-i18n-liberty'
           'python2-oslo-context-liberty'
           'python2-webob>=1.2.3')
  cd "${srcdir}/oslo.middleware-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
