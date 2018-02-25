# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname=vdf
pkgname=(python-vdf-git python2-vdf-git)
pkgver=2.3.r2.ef28616
pkgrel=1
pkgdesc="Library for working with Valve's VDF text format"
arch=('any')
url='https://github.com/ValvePython/vdf'
license=('MIT')
depends=()
makedepends=(python-setuptools)
checkdepends=(python python2 python-nose python-coverage python-mock python2-nose python2-coverage python2-mock)
source=("git://github.com/ValvePython/vdf")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

check() {
  cd "$srcdir/$_pkgname"
  python setup.py test
  python2 setup.py test
}

package_python-vdf-git() {
  depends=(python)
  cd "$srcdir/$_pkgname"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-vdf-git() {
  depends=(python2)
  cd "$srcdir/$_pkgname"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
