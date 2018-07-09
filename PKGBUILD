# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=(python-dbusmock python2-dbusmock)
_pkgname=python-dbusmock
pkgver=0.18
pkgrel=1
pkgdesc='Mock D-Bus objects for tests'
arch=(any)
url='https://github.com/martinpitt/python-dbusmock'
license=(LGPL3)
depends=()
makedepends=()
checkdepends=(python-nose python2-nose)
source=("https://github.com/martinpitt/python-dbusmock/releases/download/${pkgver}/python-dbusmock-${pkgver}.tar.gz")
sha256sums=('7721e2db4f99a1901389431f02dd4f6bde03a8e541fa5a39bcbf805bb15eb82a')

BUILDENV+=('!check')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
  python2 setup.py test
}

package_python-dbusmock() {
  depends=(python)
  makedepends=(python-setuptools)
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-dbusmock() {
  depends=(python2)
  makedepends=(python2-setuptools)
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
