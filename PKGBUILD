# Maintainer: Ivan Semkin (ivan at semkin dot ru)

pkgname=(python-dbusmock-git python2-dbusmock-git)
_pkgname=python-dbusmock
pkgver=0.17.2.r5.fae4be7
pkgrel=1
pkgdesc='Mock D-Bus objects for tests'
arch=(any)
url='https://github.com/martinpitt/python-dbusmock'
license=(LGPL3)
depends=()
makedepends=()
#checkdepends=(python-nose python2-nose)
source=('git+https://github.com/martinpitt/python-dbusmock')
sha256sums=('SKIP')

#check() {
#  cd "${srcdir}/${_pkgname}-${pkgver}"
#  python setup.py test
#  python2 setup.py test
#}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

package_python-dbusmock-git() {
  depends=(python)
  makedepends=(python-setuptools)
  cd "${srcdir}/${_pkgname}"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-dbusmock-git() {
  depends=(python2)
  makedepends=(python2-setuptools)
  cd "${srcdir}/${_pkgname}"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
