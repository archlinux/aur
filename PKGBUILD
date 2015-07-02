# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-log-liberty"
pkgver=1.5.0
pkgrel=1
pkgdesc="Oslo Logging configuration library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.log"
license=("Apache")
provides=("python2-oslo-log")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.log/oslo.log-${pkgver}.tar.gz")
sha256sums=('6c02c56acc088d6500c3bcf8c6ae91e73b759fd622a0408dc70ee274d4fac331')

build() {
  cd "${srcdir}/oslo.log-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-log-liberty() {
  depends=('python2-pbr>=0.6'
           'python2-babel>=1.3'
           'python2-six>=1.9.0'
           'python2-iso8601>=0.1.9'
           'python2-oslo-utils-liberty'
           'python2-oslo-config-liberty'
           'python2-oslo-i18n-liberty'
           'python2-oslo-context-liberty'
           'python2-oslo-serialization-liberty')
  cd "${srcdir}/oslo.log-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
