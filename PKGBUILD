# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-keystonemiddleware-liberty"
pkgver=1.6.1
pkgrel=1
pkgdesc="Middleware for OpenStack Identity"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/keystonemiddleware/"
license=("Apache")

depends=(
  "python2"
  "python2-babel"
  "python2-oslo-config-liberty"
  "python2-oslo-context-liberty"
  "python2-oslo-i18n-liberty"
  "python2-oslo-serialization-liberty"
  "python2-oslo-utils-liberty"
  "python2-pbr>=0.6"
  "python2-pycadf>=0.8.0"
  "python2-keystoneclient-liberty"
  "python2-requests>=2.2.0"
  "python2-six>=1.9.0"
  "python2-webob>=1.2.3"
)

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/k/keystonemiddleware/keystonemiddleware-${pkgver}.tar.gz")
md5sums=('d4534279089d8782152adee31e331d9a')

build() {
  cd "${srcdir}/keystonemiddleware-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/keystonemiddleware-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

