# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-log-kilo"
pkgver=1.0.0
pkgrel=1
pkgdesc="Oslo Logging configuration library"
arch=("any")
url="https://pypi.python.org/pypi/oslo.log"
license=("Apache")
provides=("python2-oslo-log")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.log/oslo.log-${pkgver}.tar.gz")
sha256sums=('3d66e9a70b82bc1c7c0b70114d093620e86bef679177ee1ec668c6e0a1acf52a')

build() {
  cd "${srcdir}/oslo.log-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-log-kilo() {
  depends=('python2-pbr>=0.6' 'python2-babel>=1.3' 'python2-six>=1.9.0' 'python2-iso8601>=0.1.9' 'python2-oslo-utils-kilo>=1.2.0' 'python2-oslo-config>=1.2.0' 'python2-oslo-i18n-kilo>=1.3.0' 'python2-oslo-context-kilo>=0.2.0' 'python2-oslo-serialization-kilo>=1.4.0')
  cd "${srcdir}/oslo.log-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
