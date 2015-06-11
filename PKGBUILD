# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-keystonemiddleware-kilo"
pkgver=1.5.1
pkgrel=1
pkgdesc="Middleware for OpenStack Identity"
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/keystonemiddleware/"
license=("Apache")

depends=(
  "python2"
  "python2-babel"
  "python2-iso8601"
  "python2-netaddr"
  "python2-oslo-config"
  "python2-pbr"
  "python2-keystoneclient"
  "python2-requests"
  "python2-six"
  "python2-webob"
)

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/k/keystonemiddleware/keystonemiddleware-${pkgver}.tar.gz")
md5sums=('56972470e94f4f56c915ed9cd6b4b60e')

build() {
  cd "${srcdir}/keystonemiddleware-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/keystonemiddleware-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

